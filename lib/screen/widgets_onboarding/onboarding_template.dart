import 'package:flutter/material.dart';
import 'package:hd_shoesshop/data/onboarding_data.dart'; // Nhập lớp OnBoardData

class ContentTemplate extends StatelessWidget {
  const ContentTemplate({
    super.key,
    required this.item, // Dữ liệu của mục onboarding
  });

  final OnBoardData item; // Dữ liệu của mục onboarding

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Lấy kích thước màn hình

    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Căn chỉnh nội dung ở giữa cột
      children: [
        // Đặt một khoảng cách lớn trước hình ảnh để hình ảnh gần giữa màn hình
        SizedBox(height: size.height * 0.15), // Khoảng cách từ trên màn hình đến hình ảnh
        Image.asset(
          item.image, // Đường dẫn đến hình ảnh của mục onboarding
          height: size.height * 0.3, // Chiều cao của hình ảnh (30% của chiều cao màn hình)
        ),
        SizedBox(height: size.height * 0.05), // Khoảng cách giữa hình ảnh và tiêu đề
        FittedBox(
          child: Text(
            item.title, // Tiêu đề của mục onboarding
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black, // Màu chữ của tiêu đề
              fontSize: 22,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01), // Khoảng cách giữa tiêu đề và mô tả
        Text(
          item.shortDescription, // Mô tả ngắn gọn của mục onboarding
          style: TextStyle(
            color: Colors.black, // Màu chữ của mô tả
            fontSize: 14,
          ),
          textAlign: TextAlign.center, // Căn giữa mô tả
        ),
        SizedBox(height: size.height * 0.05), // Khoảng cách bên dưới để tạo không gian
      ],
    );
  }
}
