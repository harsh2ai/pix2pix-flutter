from flask import Flask, request, jsonify
import werkzeug
import os
import torch_utils

from torch_utips import transform_image,get_prediction
import io
import PIL
from PIL import Image



import torch_utils 


app = Flask(__name__)
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg'}
def allowed_file(filename):
    # xxx.png
    x = '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS
    print(x)
    return x

@app.route('/predict', methods=['POST'])
def predict():
    if request.method == 'POST':
        imagefile = request.files['image']
        print("image at pt 1")
        filename = werkzeug.utils.secure_filename(imagefile.filename)
        print(filename)
        print(os.getcwd())
        #file = request.files.get('file')
        if filename is None or filename == "":
            return jsonify({'error': 'no file'})
        if not allowed_file(filename):
            return jsonify({'error': 'format not supported'})

        try:
            img_bytes = filename.read()
            tensor = transform_image(img_bytes)
            prediction = get_prediction(tensor)
            data = {'prediction': prediction.item(), 'class_name': str(prediction.item())}
            return jsonify(data)
        except:
            return jsonify({'error': 'error during prediction'})
    
import base64
import requests
from pathlib import Path
@app.route('/upload', methods=["POST"])
def upload():
    if (request.method == "POST"):
       # image = requests.get('image',stream=True)
        image = request.files['image']
      #  print("image at pt 1")
        filename = werkzeug.utils.secure_filename(image.filename)
      #  x= requests.get(str(filename),stream=True)
        print(os.getcwd() + filename)
        print("\nReceived image File name : " + image.filename)
        path=Path(os.getcwd()+"/flask-server/uploadedimages/"+filename)
        print(str(path))
        image.save("E:\\flutter-props\\flask-server\\uploadedimages\\" + filename)
      #  print(filename)
        print("image retrived")
       # img_bytes = Image.open(io.BytesIO(path))
        with open(str(path), "rb") as image_file:
         data = base64.b64encode(image_file.read())
        #img_string=base64.b64encode(image.read(str(path)))
        print('ass')
        tensor = transform_image(data)
        print(tensor)
        print("aas")
        prediction = get_prediction(tensor)
        datas = {'prediction': prediction.item(), 'class_name': str(prediction.item())}
        print(datas.items())
        
        return jsonify(datas)

if __name__ == "__main__":
    app.run(debug=True, port=5000)
