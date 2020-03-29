from flask import Flask, render_template
from flask_socketio import SocketIO, send
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SECRET_KEY'] = 'mysecret'
socketio = SocketIO(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/comment'
db = SQLAlchemy(app)

class History(db.Model):
	id = db.Column('id', db.Integer, primary_key=True)
	message = db.Column('message', db.String(500))

# on a message being sent, it will commit to the database
@socketio.on('message')
def handleMessage(msg):
	print('Message: ' + msg)

	message = History(message=msg)
	db.session.add(message)
	db.session.commit()

	send(msg, broadcast=True)

@app.route('/')
def index():
	# messages = ['Message One', 'Message Two', 'Message Three']
	messages = History.query.all()
	return render_template('index.html', messages=messages)

if __name__ == '__main__':
	socketio.run(app, debug=True)