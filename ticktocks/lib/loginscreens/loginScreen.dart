import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ticktocks/HomePage.dart';
import 'package:ticktocks/loginscreens/signupScreen.dart';

import 'forgetPassword.dart';
import '../components/methods.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showpass = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                      'Welcome to Visualizer',
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
                        customtextfield(
                            controller: _emailController,
                            hinttext: 'Enter your registered Email ID',
                            labeltext: 'Email'),
                        SizedBox(
                          height: 40,
                        ),
                        customtextfield(
                            controller: _passwordController,
                            hinttext: 'Enter your password',
                            labeltext: 'Password',
                            showText: showpass),
                        Align(
                          heightFactor: 1.5,
                          alignment: Alignment.centerRight,
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  showpass = !showpass;
                                });
                              },
                              child: Text(
                                'Show Password',
                                style: TextStyle(color: Colors.deepOrange),
                              )),
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
                  NoAccSignup(),
                  SizedBox(height: 20),
                  Container(
                    child: Text.rich(
                      TextSpan(text: "Forgot your password?\n", children: [
                        TextSpan(
                          text: 'Reset Password',
                          style: TextStyle(color: Colors.deepOrange),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return ForgetPassScreen();
                              }));
                            },
                          mouseCursor: SystemMouseCursors.click,
                        )
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignupPage();
            }));
          },
        mouseCursor: SystemMouseCursors.click,
      )
    ]));
  }
}
