####################################################################
Introduction
####################################################################
mentor. is an online ‘mentoring’ platform connecting people who want to learn and share any skills, knowledge and real-life experiences. Users can act as both ‘mentor’ and ‘mentee’ - as the former, they can create their own courses, fixing their availability and price, and as the latter, they can search for, sign up and pay for various courses. mentor. even allows for users to discuss courses and share feedback through a public chat room. 
The microservices in our enterprise solution are: Course, Chat, User, Mentor, Booking_reply, Booking_run, Booking

####################################################################
Prerequisites
####################################################################
We have included a requirements.txt with the required Python libraries to be installed. In your command prompt, navigate to the parsa directory (/app/parsa), and run the following command:
	pip3 install -r requirements.txt
This will install the dependencies needed for our web application. Please also ensure that you have WAMP and RabbitMQ installed with all services running, and can access PHPMyadmin. 

####################################################################
Database
####################################################################
In order for our app to function as intended, you will need to load our database from our sql folder (/app/sql), into their respective localhost databases. Please follow the naming conventions:
	course.sql -> course
	chat.sql -> chat
	user.sql -> user
	paypage.sql -> paypage

####################################################################
Starting the Microservices
####################################################################
To start microservices, please navigate to the parsa folder (/app/parsa) and the run in separate command prompt windows:
1) course.py via docker
	a. In your terminal, run the command: 
		docker pull y4nrui/is213:course
	b. Before going to the next step, ensure you have the user "is213" created in you phpMyAdmin

	c. In your terminal, run the Course microservice in a container with the command
		docker run -p 5000:5000 -e dbcourse=mysql+mysqlconnector://is213@host.docker.internal:3306/course y4nrui/is213:course
2) user.py
3) chat.py
4) mentor.py
5) booking_reply.py
6) booking_run.py
Each .py file can be run with the command:
	python <filename>.py

####################################################################
Google Login
####################################################################
To use our services, you will need to sign in first. (You will be redirected to our 'please sign in' page elsewise). You can sign in with the upper left "Google Login" button. You might need to provide your email and password if you are not already signed in. Please rest assured that these parameters are not collected or stored by us.

####################################################################
Payment Credentials
####################################################################
Please using the following card details when submitting payment:
Card Number: 4242 4242 4242 4242
MM/YY CVC ZIP: 04/24 244 42424

####################################################################
Course Posting Details
####################################################################
When adding a new course, you are required to upload an image. You can do so with the test.png provided in parsa folder (/app/parsa)

####################################################################
Additional Details
####################################################################
If you would like to view to the transaction history, please use the following link: 
	http://localhost/project-g4t4/app/parsa/paypage/transaction.php

********************************************************************
Course and Team Information
********************************************************************
IS213 Enterprise Solution Development
AY2019-2020, Term 2 
Section G1
Team 4

********************************************************************
Authors
********************************************************************
Jireh Tan Yan Kiat
Megan Sim Tze Yen
Sia Yan Rui, Jayden
Wang Piao 
Wong Wan Ning Winnie
Yohana Meiliana Lee

********************************************************************
Acknowledgement
********************************************************************
Professor: Dr Jiang Lingxiao
Instructor: Lum Eng Kit
Teaching Assistant: Delin
