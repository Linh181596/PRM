import 'package:flutter/material.dart';

// =============================================================================
// EXERCISE 5: DEBUG & FIX COMMON UI ERRORS
// =============================================================================
class Exercise5 extends StatelessWidget {
  const Exercise5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Exercise 5 - Common UI Fixes",
          style: TextStyle(fontSize: 22),
        ),
      ),

      // SingleChildScrollView giúp toàn bộ màn hình có thể cuộn được, tránh lỗi tràn màn hình (Overflow)
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // 1. Widget hiển thị danh sách phim
              MovieListDemo(),

              Divider(height: 30), // Đường phân cách

              // 2. Widget thử nghiệm cập nhật trạng thái (State)
              CounterDemo(),

              Divider(height: 30), // Đường phân cách

              // 3. Widget thử nghiệm chọn ngày (DatePicker)
              DatePickerDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

// 1. DANH SÁCH PHIM
class MovieListDemo extends StatelessWidget {
  const MovieListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách tên các bộ phim
    final List<String> movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Correct ListView inside Column using Expanded',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),

        // Giới hạn chiều cao cố định cho ListView khi nằm bên trong SingleChildScrollView
        SizedBox(
          height: 220,
          child: ListView.builder(
            shrinkWrap: true, // Co dãn danh sách theo đúng dung lượng phần tử
            physics: const NeverScrollableScrollPhysics(), // Tắt cuộn riêng của ListView
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.movie),
                title: Text(movies[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}


// 2. ĐẾM SỐ
class CounterDemo extends StatefulWidget {
  const CounterDemo({super.key});

  @override
  State<CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<CounterDemo> {
  // Biến đếm số nguyên
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fix State Update Issue (setState)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // Hiển thị số đếm và nút tăng
        Row(
          children: [
            Text('Counter: $counter', style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                // Phải gọi setState() để thông báo cho Flutter vẽ lại UI khi biến counter tăng
                setState(() {
                  counter++;
                });
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ],
    );
  }
}

// 3. CHỌN NGÀY
class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({super.key});

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
    DateTime? selectedDate;

  // Hàm mở cửa sổ chọn ngày sử dụng context của _DatePickerDemoState
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Fix DatePicker BuildContext Error',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text('Pick Date'),
            ),
            const SizedBox(width: 16),
            Text(
              selectedDate == null
                  ? 'No Date'
                  : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
