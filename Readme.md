# Implementation of Pix2Pix GAN with flutter Frontend

```

 #Project Structure
 
    |______flask-server
       |______app-v1.py
       |____torch_utils.py
       |____torch_utips.py
       |____model_ffn.pth
       |______uploadedImages<DIR>
    |______ticktocks<Flutter and Dart Files>       
    |______test
       |____torch_utils.py
       |____test.py
       |____model.py
   |______requirements.txt
    
```


## Getting started 

It is suggested to activate or create your own venv using conda before proceeding although not necessary.

### &#x27A3; Steps for starting the flask server
 1. Clone the repo
 2. Change your working directory to repo you cloned
 3. Using CLI run command ``` pip install requirements.txt```
 4. Change your working dir to flask server and run command ```set FLASK_APP=app-v1.py```
 5. run command ```flask run``` if on cli or use your default IDE to start the flask server
 6. Your Flask server is now running at port 5000 of localhost by default to change the port number go to ```app-v1.py``` and change any desired port number of your wish
 
 
### &#x27A3; Startup NGROK

NGROK is a service which is used to tunnel or map your localhost to a global networking address for instance you have a project running at your localhost and you want to show your friend how great it looks and its functionality are, you can use NGROK service and send him an IP address where he can check out your project.
Go to [ngrok.io](https://ngrok.io) , Sign up and finish Installation process and follow further instructions given


**&#x27AB;** Power up the NGROK CLI and enter ```ngrok http 5000``` change ```5000``` if you changed port number in your ```app-v1.py``` and copy the forwarding ip address you recieved


### &#x27A3; Changes to be made in main.dart

Under ``` uploadImage() async``` at ```Uri.parse()``` paste the URL you recieved from NGROK server cli and do not delete ```/upload``` after the url you just pasted because that is our API endpoint for communicating to flask server via flutter

Fire up the Flutter APP by running ```flutter run``` in a different CLI or by using your IDE

## **Warning** This code has been tested only on a physical device with USB Debugging, so you might need to debug it in case of running on an emulator or via wifi upload option




```
-------------------------------------------------------------
 Author -  Harsh
         - harshris2314@gmail.com
         
-------------------------------------------------------------
