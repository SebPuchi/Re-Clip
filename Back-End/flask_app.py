
from flask import Flask, request, jsonify
from tts_service import save_tts_audio

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/create_tts", methods=["POST"])
def create_tts():
    try:
        data = request.get_json()

        if 'text' in data:
            text = data['text']
            filename = data['filename']
            print(f"Received text: {text}")
            filename = f"filename.mp3"
            save_tts_audio(text, filename)
            return "Done", 200
            
        else:
            return jsonify({"error": "Missing 'text' in JSON payload"}), 400

    except Exception as e:
        return jsonify({"error": str(e)}), 500