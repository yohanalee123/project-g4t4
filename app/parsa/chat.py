from flask import Flask, render_template
from flask_socketio import SocketIO, send
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
# app.config['SECRET_KEY'] = 'mysecret'
socketio = SocketIO(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/chat'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

class History(db.Model):
	__tablename__ = 'history'
	
	ChatID = db.Column(db.Integer, primary_key=True)
	Message = db.Column(db.String(500))


# on a message being sent, it will commit to the database
@socketio.on('message')
def handleMessage(Message):
	print('Message: ' + Message)

	message = History(Message=Message)
	db.session.add(message)
	db.session.commit()

	send(Message, broadcast=True)

@app.route('/')
def get_all():
	messages = History.query.all()
	return render_template('index.html', messages=messages)

if __name__ == '__main__':
	socketio.run(app, port=5001, debug=True)