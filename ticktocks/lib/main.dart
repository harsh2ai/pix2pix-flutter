import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Img Upload User'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? SelectedImage;
  String? message;

  uploadImage() async {
    final request = http.MultipartRequest(
        "POST", Uri.parse("https://e8a4-103-219-133-32.ngrok.io/upload"));
    final headers = {"ContentType": "multipart/form-data"};

    request.files.add(http.MultipartFile('image',
        SelectedImage!.readAsBytes().asStream(), SelectedImage!.lengthSync(),
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
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    SelectedImage = File(pickedImage!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SelectedImage == null
                ? Text("Please upload a image")
                : Image.file(SelectedImage!),
            TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: uploadImage,
                icon: Icon(
                  Icons.upload_file,
                  color: Colors.white,
                ),
                label: Text(
                  "upload Image",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
