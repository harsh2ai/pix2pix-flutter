import 'package:flutter/material.dart';
import 'package:ticktocks/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue, appBarTheme: AppBarTheme(color: Colors.deepOrange)),
        home: LoginScreen()
        // home: const MyHomePage(title: 'Img Upload User'),
        );
  }
}
