import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ticktocks/Screen2.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? SelectedImage;
  String? message;
  bool imageNotSelectedError = false;

  ColorizeImage() async {
    final request = http.MultipartRequest("POST", Uri.parse("https://8ede-180-149-225-244.ngrok.io/upload"));
    final headers = {"ContentType": "multipart/form-data"};

    request.files.add(http.MultipartFile('image', SelectedImage!.readAsBytes().asStream(), SelectedImage!.lengthSync(),
        filename: SelectedImage!.path.split("/").last));

    request.headers.addAll(headers);

    final response = await request.send();
    print("awaiting");
    http.Response res = await http.Response.fromStream(response);
    print(res.body);
    final resJson = jsonDecode(res.body);

    message = resJson["prediction"];
    setState(() {});
  }

  Future getImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    SelectedImage = File(pickedImage!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text('Visualizer'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectedImage == null
                ? Container(
                    height: height * 0.5,
                    width: width * 0.9,
                    color: Colors.grey.withOpacity(0.5),
                    child: Center(
                      child: Text(
                        "Please upload an image\n from gallery",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                : Container(
                    height: height * 0.5,
                    width: width * 0.9,
                    child: Image.file(SelectedImage!),
                  ),
            SizedBox(height: 20),
            if (imageNotSelectedError)
              Text(
                'No image has been selected',
                style: TextStyle(color: Colors.red),
              ),
            TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (SelectedImage == null) {
                    imageNotSelectedError = true;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Screen2();
                      },
                    ));
                  } else {
                    imageNotSelectedError = false;
                    // ColorizeImage;
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return Screen2();
                    // },
                    // ));
                  }
                  setState(() {});
                },
                icon: Icon(
                  Icons.wifi_protected_setup_sharp,
                  color: Colors.white,
                ),
                label: Text(
                  "Process Image",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: getImage,
        child: Icon(
          Icons.upload_file,
          color: Colors.white,
        ),
      ),
    );
  }
}
