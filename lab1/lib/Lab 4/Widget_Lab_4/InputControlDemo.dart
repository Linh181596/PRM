import 'package:flutter/material.dart';

// 1. DEMO SLIDER
class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  // Biến lưu trữ giá trị hiện tại của thanh Slider (từ 0.0 đến 100.0)
  var currentValue = 0.0;

  // Hàm xử lý khi người dùng kéo/thay đổi giá trị Slider
  void SliderChange(double newValue) {
    setState(() {
      currentValue = newValue; // Cập nhật trạng thái và vẽ lại giao diện
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tiêu đề của phần Slider
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Rating (Slider)",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Widget Slider
        Slider(
          activeColor: Colors.indigo, // Màu của phần thanh đã kéo
          value: currentValue,        // Giá trị hiện tại
          min: 0,                     // Giá trị nhỏ nhất
          max: 100,                   // Giá trị lớn nhất
          divisions: 100,             // Chia thanh trượt thành 100 nấc
          onChanged: SliderChange,   // Bắt sự kiện khi kéo trượt
        ),

        // Hiển thị giá trị đã chọn bên dưới Slider
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Current value: ${currentValue.round()}', // round() để làm tròn bỏ phần thập phân .0
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

// 2. DEMO SWITCH
class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  // Biến lưu trạng thái Bật (true) hoặc Tắt (false)
  bool isSwitched = false;

  // Hàm xử lý khi người dùng gạt công tắc Switch
  void switchChange(bool newValue) {
    setState(() {
      isSwitched = newValue; // Cập nhật trạng thái mới
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tiêu đề phần Switch
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Active (Switch)",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Hàng chứa dòng chữ câu hỏi và nút công tắc Switch
        Row(
          children: [
            const SizedBox(width: 16), // Tạo khoảng cách lề trái cho câu hỏi
            const Expanded(
              flex: 3,
              child: Text(
                'Is movie active?',
                style: TextStyle(fontSize: 20),
              ),
            ),

            // Nút công tắc Switch
            Expanded(
              flex: 1,
              child: Switch(
                value: isSwitched,          // Trạng thái hiện tại của Switch
                activeColor: Colors.indigo, // Màu khi bật công tắc
                onChanged: switchChange,    // Gọi hàm khi gạt công tắc
              ),
            ),
          ],
        ),
      ],
    );
  }
}


// 3. DEMO RADIO LIST TILE
class RadioListTileDemo extends StatefulWidget {
  const RadioListTileDemo({super.key});

  @override
  State<RadioListTileDemo> createState() => _RadioListTileDemoState();
}

class _RadioListTileDemoState extends State<RadioListTileDemo> {
  // Biến lưu trữ thể loại phim được chọn (null nếu chưa chọn mục nào)
  String? selectedValue;

  // Hàm xử lý khi nhấn chọn Radio
  void RadioListTileChange(String? newValue) {
    setState(() {
      selectedValue = newValue; // Cập nhật thể loại được chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tiêu đề phần Radio
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Genre (RadioListTile)',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Tùy chọn 1: Action
        RadioListTile<String>(
          title: const Text('Action'),
          value: 'Action',            // Giá trị của tùy chọn này
          groupValue: selectedValue,  // So sánh với giá trị đang chọn trong nhóm
          toggleable: true,           // Cho phép nhấn lần 2 để bỏ chọn (trả về null)
          onChanged: RadioListTileChange,
        ),

        // Tùy chọn 2: Comedy
        RadioListTile<String>(
          title: const Text('Comedy'),
          value: 'Comedy',            // Giá trị của tùy chọn này
          groupValue: selectedValue,  // So sánh với giá trị đang chọn trong nhóm
          toggleable: true,           // Cho phép nhấn lần 2 để bỏ chọn (trả về null)
          onChanged: RadioListTileChange,
        ),

        // Hiển thị kết quả thể loại đã chọn
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Selected genre: ${selectedValue ?? 'None'}', // 'None' hiển thị khi selectedValue bị null
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}

// 4. DEMO DATE PICKER
class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({super.key});

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  // Biến lưu trữ ngày/tháng/năm được chọn
  DateTime? selectedDate;

  // Hàm mở cửa sổ chọn ngày (Bất đồng bộ dùng Future/async/await)
  Future<void> selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(), // Ngày hiển thị mặc định khi mở lịch
      firstDate: DateTime(2000),                  // Giới hạn năm nhỏ nhất
      lastDate: DateTime(2100),                   // Giới hạn năm lớn nhất
    );

    // Nếu người dùng chọn ngày (không bấm nút Cancel)
    if (picked != null) {
      setState(() {
        selectedDate = picked; // Cập nhật ngày được chọn
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Nút bấm để mở lịch chọn ngày
    return ElevatedButton(
      onPressed: selectDate,
      child: const Text('Open Date Picker'),
    );
  }
}
