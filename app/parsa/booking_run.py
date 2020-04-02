from flask import Flask
import os

app = Flask(__name__)


@app.route("/run")
def run():
    try:   
        os.system('python booking.py')
        return "Success"
    except:
        return "Fail"
    

if __name__ == "__main__":
    app.run(port=5050, debug=True)
