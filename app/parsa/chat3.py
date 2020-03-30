from flask import Flask, render_template
from flask_socketio import SocketIO
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
socketio = SocketIO(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/chat'
db = SQLAlchemy(app)

class Chat(db.Model):
    ChatID = db.Column(db.Integer, primary_key=True)
    User = db.Column(db.String(30))
    Message = db.Column(db.String(500))

@app.route('/')
def sessions():
    return render_template('chat3.html')

def messageReceived(methods=['GET', 'POST']):
    print('message was received!!!')

@socketio.on('my event')
def handle_my_custom_event(json, methods=['GET', 'POST']):
    print('received my event: ' + str(json))
    socketio.emit('my response', json, callback=messageReceived)

    message = Chat(Message=json)

if __name__ == '__main__':
    socketio.run(app, port=5003, debug=True)