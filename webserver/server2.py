from flask import Flask, request, jsonify, render_template
from datetime import date
import pandas as pd 
import json 
import csv   
import sqlite3
import aiosqlite

app = Flask(__name__)

DATABASE = 'C:\\Users\\vabischevich\\Documents\\GitHub\\mikalai-vabishchevich\\webserver\\db\\data_file.db'

@app.route('/')
def index():
    return render_template('main.html')

@app.route('/json-example1', methods=['POST'])
def json_example1():
    request_data = request.get_json()
    with sqlite3.connect(DATABASE, check_same_thread=False) as conn:
        for entry in request_data:
            today = date.today()
            data_con = conn.cursor()
            task = (today.strftime('%d-%m-%Y'), entry["Name"], entry["ObjectClass"] , entry["PrincipalSource"], entry["PCName"])
            sql = 'INSERT INTO domain_admin_local (Date,Name,ObjectClass,PrincipalSource,PCName) VALUES(?,?,?,?,?);'
            data_con.execute( sql, task )
            conn.commit()
    return 'OK'

@app.route("/data", methods = ['GET'])
def data():
    with sqlite3.connect(DATABASE, check_same_thread=False) as conn:
        data_con = conn.cursor()
        sql = 'SELECT Date, Name, ObjectClass, PCName FROM domain_admin_local'
        data = data_con.execute(sql).fetchall()
    return render_template('index.html', header=data)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080 ,debug=True)


    