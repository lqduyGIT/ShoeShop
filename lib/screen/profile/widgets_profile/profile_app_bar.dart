import 'package:flutter/material.dart';

// Widget AppBar dành cho trang chi tiết sản phẩm
class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Màu nền của AppBar
      padding: EdgeInsets.all(25), // Padding xung quanh nội dung
      child: Row(
        children: [
          Icon(
            Icons.arrow_back, // Biểu tượng quay lại
            size: 30, // Kích thước biểu tượng
            color: Colors.black, // Màu của biểu tượng
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 20), // Khoảng cách bên trái của tiêu đề
            child: Text(
              "Thông tin", // Tiêu đề của AppBar
              style: TextStyle(
                fontSize: 23, // Kích thước chữ
                fontWeight: FontWeight.bold, // Độ đậm chữ
                color: Colors.black, // Màu chữ
              ),
            ),
          ),
          // Tạo khoảng trống để đẩy các phần tử khác sang hai bên
        ],
      ),
    );
  }
}
