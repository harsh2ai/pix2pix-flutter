import 'package:flutter/material.dart';
import 'package:ticktocks/components/methods.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confimPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showpass = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confimPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.15,
          ),
          Text(
            'Create a new account',
            style: TextStyle(color: Colors.deepOrange, fontSize: 25),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Container(
            width: width * 0.7,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  customtextfield(
                      controller: _emailController, hinttext: 'Enter your registered Email ID', labeltext: 'Email'),
                  SizedBox(
                    height: 40,
                  ),
                  customtextfield(
                      controller: _passwordController,
                      hinttext: 'Enter a password',
                      labeltext: 'Password',
                      showText: showpass),
                  SizedBox(
                    height: 40,
                  ),
                  customtextfield(
                      controller: _confimPasswordController,
                      hinttext: 'confirm your password',
                      labeltext: 'Confim Password',
                      validator: (String? value) {
                        if (_confimPasswordController.text != _passwordController.text) {
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
                      if (_formKey.currentState!.validate()) {
                        print('okay to signup');
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
                          'Signup',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
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
