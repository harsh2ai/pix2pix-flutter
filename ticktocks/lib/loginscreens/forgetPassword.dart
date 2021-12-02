import 'package:flutter/material.dart';
import 'package:ticktocks/components/methods.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  _ForgetPassScreenState createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _otpcontroller = TextEditingController();
  final _formKey2 = GlobalKey<FormState>();
  final _pageController = PageController();
  bool showpass = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _otpcontroller.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Form(
        key: _formKey2,
        child: PageView(physics: NeverScrollableScrollPhysics(), controller: _pageController, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Text(
                'Enter your registered Email ID',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrange, fontSize: 25),
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
              ),
              Container(
                width: width * 0.7,
                child: Column(
                  children: [
                    customtextfield(controller: _emailController, hinttext: 'Enter your Email ID', labeltext: 'Email'),
                    SizedBox(
                      height: 80,
                    ),
                    InkWell(
                      onTap: () {
                        // if (_formKey.currentState!.validate()) {
                        //   print('okay to signup');
                        // }
                        _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: width * 0.5,
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Send OTP',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Text(
                'Enter OTP recieved at your registered Email Id',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrange, fontSize: 25),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
              ),
              Container(
                width: width * 0.7,
                child: Column(
                  children: [
                    customtextfield(controller: _otpcontroller, hinttext: 'Enter OTP', labeltext: 'OTP'),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () {
                        // if (_formKey.currentState!.validate()) {
                        //   print('okay OTP');
                        // }
                        _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: width * 0.5,
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Confirm OTP',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Text(
                'Create a new Password',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.deepOrange, fontSize: 25),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
              ),
              Container(
                width: width * 0.7,
                child: Column(
                  children: [
                    customtextfield(
                        controller: _passwordController,
                        hinttext: 'Enter new password',
                        labeltext: 'Password',
                        showText: showpass),
                    SizedBox(
                      height: 40,
                    ),
                    customtextfield(
                        controller: _confirmPasswordController,
                        hinttext: 'confirm your password',
                        labeltext: 'Confim Password',
                        validator: (String? value) {
                          if (_confirmPasswordController.text != _passwordController.text) {
                            return 'password don\'t match';
                          } else
                            return null;
                        },
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
                        if (_formKey2.currentState!.validate()) {
                          print('pass changed');
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: width * 0.5,
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            'Confirm and Reset',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
