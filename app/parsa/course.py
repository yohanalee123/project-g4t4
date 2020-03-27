from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# rename database name if needed
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/course'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
 
db = SQLAlchemy(app)


class Course(db.Model):
    __tablename__ = 'course'

    CourseID = db.Column(db.Integer, primary_key=True)
    CourseName = db.Column(db.String(64), nullable=False)
    CourseInfo = db.Column(db.String(1024), nullable=False)
    CourseType = db.Column(db.String(64), nullable=False)
    Price = db.Column(db.Float(precision=2), nullable=False)
    Availability = db.Column(db.String(2048), nullable=True)
    Image = db.Column(db.String(2048), nullable=True)

    def __init__(self,CourseID, CourseName, CourseInfo, CourseType, Price, Availability, Image):
        self.CourseID = CourseID
        self.CourseName = CourseName
        self.CourseInfo = CourseInfo
        self.CourseType = CourseType
        self.Price = Price
        self.Availability = Availability
        self.Image = Image
 
    def json(self):
        return {"CourseID": self.CourseID, "CourseName": self.CourseName, "CourseInfo": self.CourseInfo, "CourseType": self.CourseType, "Price": self.Price, "Availability": self.Availability, "Image": self.Image}
 
@app.route("/course")
def get_all():
	return jsonify({"courses": [course.json() for course in Course.query.all()]})
 
@app.route("/course/<int:CourseID>")
def find_by_CourseID(CourseID):
    course = Course.query.filter_by(CourseID=CourseID).first()
    if course:
        return jsonify(course.json())
    return jsonify({"message": "Course not found."}), 404

# @app.route("/course/<string:CourseType>")
# def find_by_CourseType(CourseType):
#     course = Course.query.filter_by(CourseType=CourseType).first()
#     if course:
#         for item in course:
#             return jsonify(item.json())
#     return jsonify({"message": "CourseType not found."}), 404

@app.route("/course/<string:CourseType>")
def find_by_CourseType(CourseType):
    #course = Course.query.filter_by(CourseType=CourseType).first()
    course = Course.query.filter_by(CourseType=CourseType).all()
    li_course = []
    if course:  
        for item in course:
            li_course.append(item.json())

        return jsonify(li_course)
    return jsonify({"message": "Course Type not found."}),404


# @app.route("/course/<string:CourseType>")
# def find_by_CourseType(CourseType):
#     return jsonify({"courses": [course.json() for course in Course.query.filter_by(CourseType=CourseType)]})
 
@app.route("/course/<int:CourseID>", methods=['POST'])
def create_course(CourseID):
    if (Course.query.filter_by(CourseID=CourseID).first()):
        return jsonify({"message": "A course with CourseID '{}' already exists.".format(CourseID)}), 400
 
    data = request.get_json()
    course = Course(CourseID, **data)
 
    try:
        db.session.add(course)
        db.session.commit()
    except:
        return jsonify({"message": "An error occurred creating the course."}), 500
 
    return jsonify(course.json()), 201
 
if __name__ == '__main__':
    app.run(port=5000, debug=True)