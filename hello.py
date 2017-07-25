from flask import Flask, request
import json

app = Flask(__name__)

@app.route('/hello', methods=['GET'])
def print_hello():
    return 'Hello'

app.run(host='0.0.0.0', port=5555)

