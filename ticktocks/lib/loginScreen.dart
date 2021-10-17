import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ticktocks/HomePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: Colors.white,
          ),
          Container(
            width: width,
            height: height * 0.8,
            color: Colors.deepOrange,
            foregroundDecoration: halfGreyScaler(),
            child: Image(
              image: AssetImage('assets/scenery.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: height * 0.6,
            child: Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                children: [
                  Container(
                    foregroundDecoration: halfGreyScaler(),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 25, color: Colors.deepOrange),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: width * 0.7,
                    child: Column(
                      children: [
                        customtextfield(),
                        SizedBox(
                          height: 40,
                        ),
                        customtextfield(),
                        Align(
                          heightFactor: 1.5,
                          alignment: Alignment.centerRight,
                          child: Text('Show Password'),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return MyHomePage();
                            }));
                          },
                          child: Container(
                            foregroundDecoration: halfGreyScaler(),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: width * 0.5,
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  NoAccSignup()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField customtextfield() {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          // focusColor: Colors.red,
          // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), gapPadding: 10),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text('Email'),
          hintText: 'Enter your registered Email ID',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), gapPadding: 10)),
    );
  }

  BoxDecoration halfGreyScaler() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      gradient: LinearGradient(
        colors: [
          Colors.grey,
          Colors.transparent,
        ],
        begin: Alignment(0, 0.1),
        end: Alignment(0.2, 0.1),
        tileMode: TileMode.clamp,
      ),
      backgroundBlendMode: BlendMode.saturation,
    );
  }
}

class NoAccSignup extends StatelessWidget {
  const NoAccSignup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(text: "Don't have an account? ", children: [
      TextSpan(
        text: 'Sign Up',
        style: TextStyle(color: Colors.deepOrange),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            print('sign up');
          },
        mouseCursor: SystemMouseCursors.precise,
      )
    ]));
  }
}
