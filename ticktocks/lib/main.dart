import 'package:flutter/material.dart';
import 'package:ticktocks/HomePage.dart';
import 'package:ticktocks/loginscreens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, appBarTheme: AppBarTheme(color: Colors.deepOrange)),
      // home: LoginScreen(),
      home: MyHomePage(),
    );
  }
}
