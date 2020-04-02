import flask
import os

app = flask.Flask(__name__)


@app.route("/run")
def run():
    try:   
        os.system('python booking.py')
        return flask.redirect('http://localhost/project-g4t4/app/parsa/templates/run.html')
    except:
        return "Fail"
    

if __name__ == "__main__":
    app.run(port=5050, debug=True)
