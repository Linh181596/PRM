import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    // Mảng danh sách chứa các Widget cơ bản cần hiển thị
    final List listItems = [
      // 1. Widget Text: Hiển thị văn bản
      const Text(
        "Welcome to Flutter UI",
        style: TextStyle(
          fontSize: 29,
          fontWeight: FontWeight.bold, // Chữ in đậm
        ),
      ),

      // 2. Widget Icon: Hiển thị biểu tượng
      const Icon(
        Icons.movie,
        size: 120,          // Kích thước biểu tượng
        color: Colors.blue, // Màu sắc biểu tượng
      ),

      // 3. Widget Image.network: Tải và hiển thị hình ảnh từ một liên kết đường dẫn URL
      Image.network(
        "https://cdnv2.tgdd.vn/mwg-static/common/News/1585803/hinh-nen-vo-tri-06.jpg",
      ),

      // 4. Widget Card kết hợp Row và Expanded để tạo bố cục thẻ chứa thông tin
      Card(
        child: Row(
          children: [
            // Cột bên trái chứa Icon hình ngôi sao (chiếm tỷ lệ flex = 1)
            const Expanded(
              flex: 1,
              child: Center(
                child: Icon(
                  Icons.star,
                  size: 30,
                ),
              ),
            ),

            // Cột bên phải chứa ListTile hiển thị tiêu đề và mô tả (chiếm tỷ lệ flex = 6)
            const Expanded(
              flex: 6,
              child: ListTile(
                title: Text(
                  "Movie Item",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "This is a sample ListTile inside a Card",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercise 1 - Core Widgets Demo",
          style: TextStyle(fontSize: 29),
        ),
      ),

      // Dùng ListView.separated để cuộn danh sách các widget cơ bản
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15), // Khoảng cách lề ngoài
        itemCount: listItems.length, // Số lượng phần tử trong danh sách

        // Dựng phần tử theo chỉ số index
        itemBuilder: (context, index) {
          return listItems[index];
        },

        // Tạo khoảng cách giữa các phần tử trong danh sách
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16); // Khoảng cách 16px giữa các mục
        },
      ),
    );
  }
}
