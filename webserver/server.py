from flask import Flask, request, jsonify, render_template
from flask_json_multidict import get_json_multidict
import pandas as pd 
import json 
import csv   
import sqlite3

app = Flask(__name__)


def write_json(section, filename="./data.json"):
    with open(filename, "r+") as file:
        file_content = json.load(file)
        file_content.update(section)
        file.seek(0)
        json.dump(file_content, file, indent=4)

@app.route('/')
def index():
    with open('data.csv', 'r') as f:
        reader = csv.reader(f)
        header = next(reader)
    return render_template('./templates/index.html',  header=header, rows=reader)

@app.route('/json-example', methods=['POST'])
def json_example():
    filename="./data.csv"
    request_data = request.get_json()
    data = json.loads(request_data)
    Body = pd.DataFrame(data)
    csvBody = Body.to_csv()
    try:
        request_data = request.get_json()
        with open( filename, 'a+') as feedsjson:
            writer = csv.writer(feedsjson)
            writer.writerow(csvBody)

    except json.decoder.JSONDecodeError:
        print('Error file/json')       
    return 'OK'

@app.route('/json-example1', methods=['POST'])
def json_example1():
    conn = sqlite3.connect("data_file.db")
    data_con = conn.cursor()

    request_data = request.get_json()
    filename="./data.json"
    with open(filename, "w") as file:
        json.dump(request_data, file, indent=4)
    with open(filename, "r", encoding='utf-8') as file:
         data = json.load(file)

    print(data['']['Name'])
    return 'OK'



@app.route("/data", methods = ['GET'])
def data():
    with open('data.csv', 'r') as f:
        data = f.read()
    return jsonify(data)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080 ,debug=True)


    