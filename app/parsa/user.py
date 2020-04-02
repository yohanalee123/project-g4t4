from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)

# rename database name if needed
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/user'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
 
db = SQLAlchemy(app)
CORS(app)

class User(db.Model):
    __tablename__ = 'user'

    Email = db.Column(db.String(2048), primary_key=True)
    Name = db.Column(db.String(2048), nullable=False)
    UserID = db.Column(db.String(2048), nullable=False)

    def __init__(self, Email, Name, UserID):
        self.Email = Email
        self.Name = Name
        self.UserID = UserID
        
        
    def json(self):
        return {"Email": self.Email, "Name": self.Name, "UserID" : self.UserID}
 
@app.route("/user")
def get_all():
	return jsonify({"users": [user.json() for user in User.query.all()]})
 

@app.route("/user/<string:UserID>")
def find_by_UserID(UserID):
    user = User.query.filter_by(UserID=UserID).first()
    if user:
        return jsonify(user.json())
    return jsonify({"message": "User's ID not found."}), 404

# @app.route("/user/<string:Email>")
# def find_by_Email(Email):
#     user = User.query.filter_by(Email=Email).first()
#     if user:
#         return jsonify(user.json())
#     return jsonify({"message": "User's Email not found."}), 404

# @app.route("/user/<string:Name>")
# def find_by_Name(Name):
#     user = User.query.filter_by(Name=Name).first()
#     if user:
#         return jsonify(user.json())
#     return jsonify({"message": "User's Name not found."}), 404

# @app.route("/course/<string:CourseType>")
# def find_by_CourseType(CourseType):
#     course = Course.query.filter_by(CourseType=CourseType).first()
#     if course:
#         for item in course:
#             return jsonify(item.json())
#     return jsonify({"message": "CourseType not found."}), 404

# @app.route("/course/<string:CourseType>")
# def find_by_CourseType(CourseType):
#     #course = Course.query.filter_by(CourseType=CourseType).first()
#     course = Course.query.filter_by(CourseType=CourseType).all()
#     li_course = []
#     if course:  
#         for item in course:
#             li_course.append(item.json())

#         return jsonify(li_course)
#     return jsonify({"message": "Course Type not found."}),404


# @app.route("/course/<string:CourseType>")
# def find_by_CourseType(CourseType):
#     return jsonify({"courses": [course.json() for course in Course.query.filter_by(CourseType=CourseType)]})
 
@app.route("/user/<string:Email>", methods=['POST'])
def create_user(Email):
    if (User.query.filter_by(Email=Email).first()):
        return jsonify({"message": "A course with Email '{}' already exists.".format(Email)}), 400
 
    data = request.get_json()
    user = User(Email, **data)
 
    try:
        db.session.add(user)
        db.session.commit()
    except:
        return jsonify({"message": "An error occurred creating the user."}), 500
 
    return jsonify(user.json()), 201

# @app.route("/course/<string:CourseName>", methods=['POST'])
# def create_course_by_id(CourseName):
#     if (Course.query.filter_by(CourseName=CourseName).first()):
#         return jsonify({"message": "A course with CourseName '{}' already exists.".format(CourseName)}), 400
 
#     data = request.get_json()
#     course = Course(CourseName, **data)
 
#     try:
#         db.session.add(course)
#         db.session.commit()
#     except:
#         return jsonify({"message": "An error occurred creating the course."}), 500
 
#     return jsonify(course.json()), 201
 
 
if __name__ == '__main__':
    app.run(port=5001, debug=True)