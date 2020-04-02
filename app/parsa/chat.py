from flask import Flask, render_template, request
from flask_socketio import SocketIO
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
socketio = SocketIO(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/chat'
db = SQLAlchemy(app)

# class to create the database on mysql
class Chat(db.Model):
    __tablename__ = 'chat' # database name

    #database columns
    ChatID = db.Column(db.Integer, primary_key=True)
    User = db.Column(db.String(30))
    Message = db.Column(db.String(500))

def messageReceived(methods=['GET', 'POST']):
    print('message was received!!!')

# when 'my event' has been received, which is when chat3.py has received the user's inputs (username + message),
# the function below will run
@socketio.on('my event')
def handle_my_custom_event(json, methods=['GET', 'POST']):
    """
    This function saves the user's inputs into the MySQL database. It then 'emits' the response back to the html file,
    for it to render the message on the screen.
    """
    print('received my event: ' + str(json))
    
    message = Chat(User=json['user_name'], Message=json['message'])
    db.session.add(message)
    db.session.commit()

    socketio.emit('my response', json, callback=messageReceived)

@app.route('/')
def sessions():
    """
    This function retrieves all the messages currently saved in the MySQL database and sends it to the HTML file.
    It also renders the .html file on the browser (instead of this .py file) when the service is run.
    """
    messages = Chat.query.all()
    return render_template('chat.html', messages=messages)
    

if __name__ == '__main__':
    socketio.run(app, port=5003, debug=True)