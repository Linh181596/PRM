import 'package:flutter/material.dart';

class Exercise4 extends StatelessWidget {
  const Exercise4({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Themewidget.isDarkMode,
      builder: (context, isDark, child) {
        return Theme(
          data: isDark ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true),
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                style: TextStyle(fontSize: 25),
                "Exercise 4 - App Structure & Theme"
              ),
              actions: const [
                Themewidget()
              ],
            ),
            body: const Center(
              child: Text(
                'This is a simple with theme toggle',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              )
            ),
          ),
        );
      }
    );
  }
}

class Themewidget extends StatefulWidget {
  const Themewidget({super.key});

  static final ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(false);

  @override
  State<Themewidget> createState() => _ThemewidgetState();
}

class _ThemewidgetState extends State<Themewidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: Themewidget.isDarkMode,
      builder: (context, isDark, child){
        return Row(
          children: [
            const Text('Dark'),
            Switch(
              activeThumbColor: Colors.indigo,
              value: isDark,
              onChanged: (value){
                Themewidget.isDarkMode.value = value;
              },
            )
          ],
        );
      },
    );
  }
}