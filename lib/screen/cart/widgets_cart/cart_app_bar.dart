import 'package:flutter/material.dart';

// Widget hiển thị AppBar cho trang giỏ hàng
class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Màu nền của AppBar
      padding: EdgeInsets.all(25), // Padding xung quanh nội dung của AppBar
      child: Row(
        children: [
          // Nút quay lại trang trước
          InkWell(
            onTap: () {
              // Quay lại màn hình trước đó
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back, // Biểu tượng mũi tên quay lại
              size: 30, // Kích thước biểu tượng
              color: Colors.black, // Màu biểu tượng
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 20), // Khoảng cách bên trái của tiêu đề
            child: Text(
              "Giỏ hàng", // Tiêu đề của AppBar
              style: TextStyle(
                fontSize: 23, // Kích thước chữ
                fontWeight: FontWeight.bold, // Độ đậm chữ
                color: Colors.black, // Màu chữ
              ),
            ),
          ),
          Spacer(), // Khoảng trống giữa tiêu đề và biểu tượng thêm
          Icon(
            Icons.more_vert, // Biểu tượng ba chấm dọc
            size: 30, // Kích thước biểu tượng
            color: Colors.black, // Màu biểu tượng
          )
        ],
      ),
    );
  }
}
