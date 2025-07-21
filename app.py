from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return 'Welcome to the DDoS Header Checker API!'

@app.route('/api/check', methods=['POST'])
def check_headers():
    headers = dict(request.headers)
    # Simple example logic
    if "X-Forwarded-For" in headers:
        return jsonify({"warning": "Possible spoofing header detected"}), 200
    return jsonify({"message": "Headers look normal"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
