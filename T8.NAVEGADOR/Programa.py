
from flask import Flask, redirect, url_for, request,render_template, abort,jsonify
import os, json

app = Flask("CodeFlix")

@app.route('/')
def home():
    return  render_template('index.html')


@app.route('/pagina1')
def pagina1():
    return  render_template('/pagina1.html')

@app.route('/pagina2')
def pagina2():
    return  render_template('/pagina2.html')

if __name__=='__main__':    
    app.run('0.0.0.0',debug=True, port=8080)