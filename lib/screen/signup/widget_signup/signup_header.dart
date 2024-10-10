import 'package:flutter/material.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Container
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
          color: Colors.black,
          width: 393,
          height: 25,
        ),
        // Back Arrow Icon with navigation
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 22),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back, // Sử dụng icon hệ thống
                color: const Color.fromARGB(255, 0, 0, 0), // Màu của icon
                size: 24, // Kích thước của icon
              ),
              onPressed: () {
                Navigator.pop(context); // Quay lại màn hình trước đó
              },
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 31),
          child: Text(
            'Bắt đầu tạo tài khoản của bạn',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xFF000000),
            ),
          ),
        ),
      ],
    );
  }
}
