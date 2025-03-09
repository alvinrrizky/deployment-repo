from flask import Flask, request
import os

app = Flask(__name__)

@app.route('/webhook', methods=['POST'])
def webhook():
    print("🔔 Webhook received! Pulling latest changes...")
    os.system("bash deploy.sh")  # Jalankan script deploy
    return "✅ App started", 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)