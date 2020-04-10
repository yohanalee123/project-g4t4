Google Login API How-to:
1) Click the Google Login button at the top right of the home page
2) Google will prompt you to login via email. If you are not signed in via email, you will be brought to the login page before you are redirected back to our website.
3) After login, the button will be replaced with your name and your userid.

Please ensure the follow services are running:
1) course.py via docker
2) user.py
3) chat.py
4) mentor.py
5) booking_reply.py
6) booking_run.py

Do ensure that there are 4 localhost sql databases created (create then import the respective sql in the sql folder) named:

1) course
2) user
3) chat
4) paypage

To run the Course microservice via Docker:
1) In your terminal, run the command: 
docker pull y4nrui/is213:course

Step 1 pulls the Docker image that contains the Course microservice via Docker Hub

Before going to Step 2, make sure you have the user "is213" created in your phpMyAdmin.

2) In your terminal, run the Course microservice in a container with the command
docker run -p 5000:5000 -e dbcourse=mysql+mysqlconnector://is213@host.docker.internal:3306/course y4nrui/is213:course