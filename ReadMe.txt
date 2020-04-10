####################################################################
Please ensure the follow services are running:
####################################################################
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

####################################################################
Do ensure that there are 4 localhost sql databases created (create then import the respective sql in the sql folder) named:
####################################################################
1) course
2) user
3) chat
4) paypage

####################################################################
Google Login API How-to:
####################################################################
1) Click the Google Login button at the top right of the home page
2) Google will prompt you to login via email. If you are not signed in via email, you will be brought to the login page before you are redirected back to our website.
3) After login, the button will be replaced with your name and your userid.


####################################################################
Payment Credentials)
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
If you would like to view to the transaction history, please use the following link: http://localhost/project-g4t4_esd/app/parsa/paypage/transaction.php

####################################################################
Course and Team Information
####################################################################
IS213 Enterprise Solution Development
AY2019-2020, Term 2 
Section G1
Team 4

####################################################################
Authors
####################################################################
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
