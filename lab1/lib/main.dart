import 'package:flutter/material.dart';
import 'package:lab1/UI/Screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomePage()
    );
  }
}
