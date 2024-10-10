import 'package:flutter/material.dart';

class Categorieswidget extends StatelessWidget {
  const Categorieswidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách chứa các danh mục và hình ảnh tương ứng
    final List<Map<String, String>> categories = [
      {"text": "Nike", "image": "assets/logo/nike.png"},
      {"text": "Adidas", "image": "assets/logo/adidas.png"},
      {"text": "Puma", "image": "assets/logo/puma.png"},
      {"text": "Asics", "image": "assets/logo/asics.png"},
      {"text": "Skechers", "image": "assets/logo/skechers.png"},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var category in categories)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Màu bóng
                    spreadRadius: 1, // Độ lan tỏa của bóng
                    blurRadius: 2, // Độ mờ của bóng
                    offset: Offset(0, 1), // Vị trí bóng
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    // Sử dụng đường dẫn hình ảnh từ danh sách
                    category["image"]!,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10), // Khoảng cách giữa hình ảnh và văn bản
                  Text(
                    category["text"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
