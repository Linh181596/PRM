import 'package:flutter/material.dart';
import 'package:lab1/Lab 4/Widget_Lab_4/InputControlDemo.dart';

class Exercise2 extends StatelessWidget {
  const Exercise2({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách chứa các Widget demo các điều khiển nhập dữ liệu
    final List listItems = [
      SliderDemo(),        // Thanh trượt đánh giá (Slider)
      SwitchDemo(),        // Công tắc bật/tắt (Switch)
      RadioListTileDemo(), // Nút chọn danh sách thể loại (RadioListTile)
      DatePickerDemo()     // Hộp thoại chọn ngày (DatePicker)
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(fontSize: 29),
          "Exercise 2 - Input Controls Demo",
        ),
      ),

      // Dùng ListView.separated để hiển thị danh sách các điều khiển có khoảng cách giữa các phần tử
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25), // Khoảng cách lề ngoài danh sách
        itemCount: listItems.length, // Số lượng phần tử trong danh sách

        // Hàm dựng từng phần tử theo chỉ số index
        itemBuilder: (context, index) {
          return listItems[index];
        },

        // Đường phân cách/khoảng cách giữa các phần tử
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16); // Khoảng cách 16px giữa các phần tử
        },
      ),
    );
  }
}
