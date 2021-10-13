from flask import Flask, request, jsonify


import werkzeug

app=Flask(__name__)

@app.route("/upload",methods=["POST"])


def upload():
    if request.method=="POST":
        imagefile=request.files['image']
        filename=werkzeug.utils.secure_filename(imagefile.filename)
        print("\n Recieved Image File name is :"+ imagefile.filename)
        imagefile.save("./uploadedimages"+filename)
        
        
        return jsonify({
            "message": "Image upload sucsessful"
        })
if __name__=="__main__":
    app.run(debug=True,port=9000)