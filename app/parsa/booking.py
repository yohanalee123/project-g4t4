import json
import sys
import os
import random
import datetime
from pprint import pprint

# Communication patterns: directmsgreply
# Use a message-broker with 'direct' exchange to enable interaction
# Use a reply-to queue and correlation_id to get a corresponding reply
import pika
import uuid
import csv

class Booking:
    # Load existing bookings from a JSON file.
    with open('Booking.json') as booking_json_file:
        booking = json.load(booking_json_file)
    booking_json_file.close()

    # Find the max of all existing "BookingID" to be used as the last BookingID
    last_booking_id = max([ o["BookingID"] for o in booking["booking"] ])

def bookings_json():
    #return all bookings as a JSON object (not a string)
    return Booking.booking
    
def bookings_save(bookings_file):
    # save all bookings to a file
    with open(bookings_file, 'w') as booking_json_outfile:
        json.dump(Booking.booking, booking_json_outfile, indent=2, default=str) # convert a JSON object to a string
    booking_json_outfile.close()

class Booking_Item:
    def __init__(self):
        self.CourseID = 0
        self.MentorID = 0

    # return an booking item as a JSON object
    def json(self):
        return {'CourseID': self.CourseID, 'MentorID': self.MentorID }

def get_all():
    #Return all bookings as a JSON object
    return Booking.booking
 
def find_by_booking_id(BookingID):
    #Return a specific booking of the BookingID
    booking = [ o for o in Booking.booking["bookings"] if o["BookingID"]==BookingID ]
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

    # Load the booking info from a cart (a file in this case)
    try:
        with open(booking_input) as sample_booking_file:
            cart_booking = json.load(sample_booking_file)
    except:
        status = 501
        message = "Error occurred in loading the booking information."
    finally:
        sample_booking_file.close()
    if status!=200:
        print("Failed booking creation.")
        return {'status': status, 'message': message}

    # Create a new booking: set up data fields in the booking as a JSON object (i.e., a python dictionary)
    booking = dict()
    
    booking["MenteeID"] = cart_booking['MenteeID']
    booking["BookingID"] = Booking.last_booking_id + 1
    booking["booking_item"] = []
    Course_item = cart_booking['booking_item']
    for index, ci in enumerate(Course_item):
        booking["booking_item"].append({"CourseID": Course_item[index]['CourseID'],
                                "MentorID": Course_item[index]['MentorID']
        })
    print("The booking is",cart_booking)
    print("Processing the booking...")
    # check if booking creation is successful
    if len(booking["booking_item"])<1:
        status = 404
        message = "Empty booking."

    if status!=200:
        print("Failed booking creation.")
        return {'status': status, 'message': message}

    # Append the newly created booking to the existing bookings
    Booking.booking["booking"].append(booking)
    # Increment the last BookingID
    Booking.last_booking_id = Booking.last_booking_id + 1
    # Write the newly created booking back to the file for permanent storage
    bookings_save("booking.new.json")
    # Return the newly created booking when creation is succssful
    if status==200:
        print("Booking creation completed.")
        return booking

def send_booking(booking):
    #inform mentor.py for the new booking 
    # default username / password to the borker are both 'guest'
    hostname = "localhost" # default broker hostname. Web management interface default at http://localhost:15672
    port = 5672 # default messaging port.
    # connect to the broker and set up a communication channel in the connection
    connection = pika.BlockingConnection(pika.ConnectionParameters(host=hostname, port=port))
    channel = connection.channel()

    # set up the exchange if the exchange doesn't exist
    exchangename="booking_direct"
    channel.exchange_declare(exchange=exchangename, exchange_type='direct')

    # prepare the message body content
    message = json.dumps(booking, default=str) # convert a JSON object to a string

    # send the message. Inform mentor and exit, leaving it to booking_reply to handle replies
    # Prepare the correlation id and reply_to queue and do some record keeping
    corrid = str(uuid.uuid4())
    row = {"BookingID": booking["BookingID"], "correlation_id": corrid}
    csvheaders = ["BookingID", "correlation_id", "status"]
    with open("corrids.csv", "a+", newline='') as corrid_file: # 'with' statement in python auto-closes the file when the block of code finishes, even if some exception happens in the middle
        csvwriter = csv.DictWriter(corrid_file, csvheaders)
        csvwriter.writerow(row)
    replyqueuename = "mentor.reply"
    # prepare the channel and send a message to mentor
    channel.queue_declare(queue='mentor', durable=True) # make sure the queue used by mentor exist and durable
    channel.queue_bind(exchange=exchangename, queue='mentor', routing_key='mentor.booking') # make sure the queue is bound to the exchange
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
    print("This is " + os.path.basename(__file__) + ": creating an booking...")
    booking = create_booking("new_booking.txt")
    send_booking(booking)
    
#    Additional functions:

#    Get all booking information using get_all() function
#    print(get_all())

#    Retrieve specific BookingID using find_by_booking_id function
#    print(find_by_booking_id(13))