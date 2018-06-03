from flask import Flask, jsonify

import datetime

app = Flask(__name__)


@app.route('/healthz', methods=['GET'])
def health_check():
    return jsonify({'healthy @': str(datetime.datetime.now())}), 200


@app.route('/calculate', methods=['GET'])
def calculate():
    return jsonify({'name': 'value'})


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, threaded=True, port=8888)
