import 'dart:io';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  // final File inputImage;
  // Screen2({required this.inputImage});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Output'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: height * 0.3,
                width: width * 0.9,
                color: Colors.grey,
                // child: Image.file(inputImage,
                // fit: BoxFit.cover,),
              ),
              SizedBox(height: 30),
              FutureBuilder(
                  // future: ,
                  builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: height * 0.4,
                    width: width * 0.9,
                    color: Colors.blueGrey,
                    // child: Image.file(inputImage
                    // fit: BoxFit.cover),
                  );
                } else
                  return Container(
                    height: height * 0.4,
                    width: width * 0.9,
                    color: Colors.grey.withOpacity(0.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Please wait while we do the magic',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 22),
                        ),
                        SizedBox(height: 20),
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
              }),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  actionButton(title: 'Save image', color: Colors.blue, icon: Icons.save),
                  actionButton(title: 'Share image', icon: Icons.share),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell actionButton({required String title, Function()? ontap, Color? color, IconData? icon}) {
    return InkWell(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.all(10),
            color: color ?? Colors.deepOrange,
            child: Row(
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                SizedBox(width: 5),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ));
  }
}
