import 'package:flutter/material.dart';

class Exercise3 extends StatelessWidget {
  const Exercise3({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Dữ liệu danh sách phim dạng List<Map>
    final List<Map<String, String>> movies = [
      {'title': 'Avatar', 'subtitle': 'Sample description'},
      {'title': 'Inception', 'subtitle': 'Sample description'},
      {'title': 'Interstellar', 'subtitle': 'Sample description'},
      {'title': 'Joker', 'subtitle': 'Sample description'},

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          style: TextStyle(fontSize: 29),
          "Exercise 3 - Layout Demo",
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 16), // Khoảng cách trống phía trên

          // 2. Tiêu đề "Now Playing"
          const Text(
            'Now Playing',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          // 3. ListView bọc trong Expanded để tự động chiếm phần không gian còn lại trên màn hình
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16), // Khoảng cách lề trên/dưới
              itemCount: movies.length, // Số lượng phim trong danh sách

              itemBuilder: (context, index) {
                final movie = movies[index]; // Lấy dữ liệu phim ở vị trí index

                return Card(
                  margin: const EdgeInsets.only(bottom: 12.0), // Khoảng cách 12px bên dưới mỗi Card
                  elevation: 1, // Độ đổ bóng nhẹ cho Card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), // Bo tròn góc Card 16px
                  ),

                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16), // Khoảng cách bên trong ListTile

                    // Icon đại diện hình tròn chứa ký tự đầu tiên của tên phim
                    leading: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.indigo.shade100,
                      child: Text(
                        movie['title']![0], // Lấy ký tự đầu tiên (ví dụ: 'A' cho Avatar)
                        style: TextStyle(
                          color: Colors.indigo.shade800,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Tên phim
                    title: Text(
                      movie['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    // Dòng mô tả ngắn dưới tên phim
                    subtitle: Text(
                      movie['subtitle']!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
