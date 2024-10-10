import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Thanh màu đen ở trên cùng
        Container(
          color: const Color(0xFF000000), // Màu nền đen
          width: 393, // Chiều rộng của thanh
          height: 25, // Chiều cao của thanh
        ),
        // Logo ở giữa
        Align(
          alignment: Alignment.topCenter, // Căn giữa logo theo chiều ngang
          child: Container(
            width: 157, // Chiều rộng của container chứa logo
            height: 157, // Chiều cao của container chứa logo
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover, // Cách hình ảnh vừa khít với container
                image: AssetImage(
                    'assets/images/Logo1.png'), // Đường dẫn hình ảnh logo
              ),
            ),
          ),
        ),
        // Tin nhắn chào mừng
        Container(
          margin: EdgeInsets.fromLTRB(
              14, 0, 14, 6), // Khoảng cách từ các cạnh (trái, phải, dưới)
          child: Align(
            alignment: Alignment.topLeft, // Căn lề bên trái
            child: Text(
              'Chào mừng bạn đến với HUYDUY STORE.\nChúng tôi rất vui vì bạn đã đến.',
              style: TextStyle(
                fontWeight: FontWeight.w600, // Độ đậm của chữ
                fontSize: 16, // Kích thước chữ
                color: const Color(0xFF333333), // Màu chữ
              ),
            ),
          ),
        ),
        // Tin nhắn mời gọi vào cửa hàng
        Container(
          margin: EdgeInsets.fromLTRB(
              14, 0, 14, 11), // Khoảng cách từ các cạnh (trái, phải, dưới)
          child: Align(
            alignment: Alignment.topLeft, // Căn lề bên trái
            child: Text(
              'Vào cửa hàng ngay để sở hữu những đôi giày độc đáo!',
              style: TextStyle(
                fontWeight: FontWeight.w300, // Độ đậm của chữ
                fontSize: 13, // Kích thước chữ
                color: const Color(0xE0232323), // Màu chữ
              ),
            ),
          ),
        ),
      ],
    );
  }
}
