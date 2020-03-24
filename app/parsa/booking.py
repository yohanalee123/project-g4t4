import json
import sys
import os
import random
import datetime

# Communication patterns:
# Use a message-broker with 'direct' exchange to enable interaction
import pika
# If see errors like "ModuleNotFoundError: No module named 'pika'", need to
# make sure the 'pip' version used to install 'pika' matches the python version used.
import uuid
import csv

class Booking:
    # Load existing bookings from a JSON file (for simplicity here). can discuss if want DB
    with open('bookings.json') as booking_json_file:
        bookings = json.load(booking_json_file)
    booking_json_file.close()

def bookings_save(bookings_file):
    """ save all bookings to a file"""
    with open(bookings_file, 'w') as booking_json_outfile:
        json.dump(Booking.bookings, booking_json_outfile, indent=2, default=str) # convert a JSON object to a string
    booking_json_outfile.close()

#!!!!!!!!!!!!!!!!!!!!!!!!!!! value need to be changed
class Booking_course:
    def __init__(self):
        self.BookingID = 0
        self.MentorID = 0
        self.MenteeID = 0
        self.CourseID = 0
        self.Timeslot = 0

    # return an booking course as a JSON object
    def json(self):
        return {'BookingID': self.BookingID, 'MenteeID': self.MenteeID , 'CourseID': self.CourseID, 'Timeslot': self.Timeslot}

def get_all():
    #Return all bookings as a JSON object
    return Booking.bookings

#!!!!!!!!!!!!!!!! again not sure if using this
def find_by_booking_id(BookingID):
    #Return a booking (bookings) of the booking_id
    booking = [ o for o in Booking.bookings["bookings"] if o["BookingID"]==BookingID ]
    if len(booking)==1:
        return booking[0]
    elif len(booking)>1:
        return {'message': 'Multiple bookings found for ID ' + str(BookingID), 'bookings': booking}
    else:
        return {'message': 'Booking not found for ID ' + str(BookingID)}

def create_booking(booking_input):
    #Create a new booking according to the booking_input
    status = 200
    message = "Success"

    # Load the booking info from a sample booking file in this case
    try:
        with open(booking_input) as sample_booking_file:
            list_booking = json.load(sample_booking_file)
    except:
        status = 501
        message = "An error occurred in loading the booking information."
    finally:
        sample_booking_file.close()
    if status!=200:
        print("Failed booking creation.")
        return {'status': status, 'message': message}
    # Create a new booking: set up data fields in the booking as a JSON object 
    booking = dict()
    booking["MenteeID"] = list_booking["MenteeID"]
    booking["BookingID"] = list_booking["BookingID"]
    booking["Course_item"] = []
    course_item = list_booking['Course_item']
    for index, ci in enumerate(course_item):
        booking["Course_item"].append({"CourseID": course_item[index]['CourseID'],
                                "CourseID": course_item[index]['CourseID'],
                                "BookingID": course_item[index]['BookingID'],
                                "MentorID": course_item[index]['MentorID'],
                                "Timeslot": course_item[index]['Timeslot']
        })

    # Append the newly created booking to the existing bookings
    Booking.bookings["bookings"].append(booking)
    
    # Write the newly created booking back to the file for permanent storage; if using a DB, this will be done by the DBMS
    bookings_save("bookings.new.json")

    # Return the newly created booking when creation is succssful
    if status==200:
        print("Booking creation is completed.")
        return booking

def send_booking(booking):
    #inform user(mentor) microservice as needed
    # default username / password to the borker are both 'guest'
    hostname = "localhost" # default broker hostname. Web management interface default at http://localhost:15672
    port = 5672 # default messaging port.
    # connect to the broker and set up a communication channel in the connection
    connection = pika.BlockingConnection(pika.ConnectionParameters(host=hostname, port=port))
        # Note: various network firewalls, filters, gateways (e.g., SMU VPN on wifi), may hinder the connections;
        # If "pika.exceptions.AMQPConnectionError" happens, may try again after disconnecting the wifi and/or disabling firewalls
    channel = connection.channel()

    # set up the exchange if the exchange doesn't exist
    exchangename="booking_direct"
    channel.exchange_declare(exchange=exchangename, exchange_type='direct')

    # prepare the message body content
    message = json.dumps(booking, default=str) # convert a JSON object to a string

    # send the message
    # always inform Monitoring for logging no matter if successful or not
    channel.basic_publish(exchange=exchangename, routing_key="user.info", body=message)
        # By default, the message is "transient" within the broker;
        #  i.e., if the monitoring is offline or the broker cannot match the routing key for the message, the message is lost.
        # If need durability of a message, need to declare the queue in the sender (see sample code below).
    
    # if there is an error in booking creation
    if "status" in booking:
         # print error message
        print(message)

    else:
        # Prepare the correlation id and reply_to queue and do some record keeping
        corrid = str(uuid.uuid4())
        row = {"BookingID": booking["BookingID"], "correlation_id": corrid}
        csvheaders = ["BookingID", "correlation_id", "status"]
        with open("corrids.csv", "a+", newline='') as corrid_file: # 'with' statement in python auto-closes the file when the block of code finishes, even if some exception happens in the middle
            csvwriter = csv.DictWriter(corrid_file, csvheaders)
            csvwriter.writerow(row)
        replyqueuename = "mentor.reply"
        # prepare the channel and send a message to Shipping
        channel.queue_declare(queue='mentor', durable=True) 
        channel.queue_bind(exchange=exchangename, queue='mentor', routing_key='mentor.booking') 
        channel.basic_publish(exchange=exchangename, routing_key="mentor.booking", body=message,
            properties=pika.BasicProperties(delivery_mode = 2, # make message persistent within the matching queues until it is received by some receiver (the matching queues have to exist and be durable and bound to the exchange, which are ensured by the previous two api calls)
                reply_to=replyqueuename, # set the reply queue which will be used as the routing key for reply messages
                correlation_id=corrid # set the correlation id for easier matching of replies
            )
        )
        print("Booking sent to mentor.")
        # close the connection to the broker
        connection.close()

    # Execute this program if it is run as a main script (not by 'import')
if __name__ == "__main__":
    print("This is " + os.path.basename(__file__) + ": creating a booking...")
    booking = create_booking("sample_booking.txt")
    send_booking(booking)

# print(get_all())
# print(find_by_booking_id(13))