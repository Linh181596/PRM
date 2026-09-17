import 'package:flutter/material.dart';
import 'package:lab1/UI/Widgets/BodyWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Home page"),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search))],
      ),
    body: BodyWidget(),
    );
  }
}
