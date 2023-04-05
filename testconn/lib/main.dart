import 'package:flutter/material.dart';
import 'splashScreen.dart';

const d_red =  Color.fromARGB(255, 16, 78, 87);
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon ptit doigt',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}