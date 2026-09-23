import 'package:flutter/material.dart';
import 'package:lab1/Lab%204/Screens_Lab_4/core_widget_demo.dart';
import 'package:lab1/Lab 4/Screens_Lab_4/Exercise_2.dart';
import 'package:lab1/Lab 4/Screens_Lab_4/Exercise_3.dart';
import 'package:lab1/Lab 4/Screens_Lab_4/Exercise_4.dart';
import 'package:lab1/Lab 4/Screens_Lab_4/Exercise_5.dart';

class Bodywidget extends StatelessWidget {
  const Bodywidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Khai báo danh sách các bài tập
    final List<Map<String, dynamic>> exercises = [
      {'title': 'Exercise 1 - Core Widgets Demo', 'page': const Exercise1()},
      {'title': 'Exercise 2 - Input Controls Demo', 'page': const Exercise2()},
      {'title': 'Exercise 3 - Layout Demo', 'page': const Exercise3()},
      {'title': 'Exercise 4 - App Structure & Theme', 'page': const Exercise4()},
      {'title': 'Exercise 5 - Common UI Fixes', 'page': const Exercise5()},
    ];

    // 2. Gộp tất cả vào một Column duy nhất
    return Column(
      children: List.generate(exercises.length, (index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Chữ nằm bên trái chiếm không gian còn lại
                Expanded(
                  child: Text(
                      style: TextStyle(fontSize: 25),
                      exercises[index]["title"]
                  ),
                ),
                // Nút mũi tên bên phải, chỉ khi bấm vào đây mới chuyển trang
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => exercises[index]["page"],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}