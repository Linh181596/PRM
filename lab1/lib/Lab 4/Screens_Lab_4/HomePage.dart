import 'package:flutter/material.dart';
import 'package:lab1/Lab 4/Widget_Lab_4/BodyWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(fontSize: 28),
          "Lab 4 - Flutter UI Fundamentals"
        ),
      ),
      body: Bodywidget()
    );
  }
}
