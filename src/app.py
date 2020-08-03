from flask import Flask, render_template, jsonify


app = Flask(__name__)

@app.route('/')
def alive():
    dict = {
        'Status': 'Alive',
    }
    return jsonify(dict)

@app.route('/home')
def home():
    dict = {
        'Status': 'Welcome in samsja cloud',
    }
    return jsonify(dict)

if __name__ == "__main__":
    app.run(debug=True)
