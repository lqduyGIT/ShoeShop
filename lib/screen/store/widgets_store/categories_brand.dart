import 'package:flutter/material.dart';

class CategoriesBrand extends StatelessWidget {
  const CategoriesBrand({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách chứa các danh mục và hình ảnh tương ứng
    final List<Map<String, String>> categories = [
      {
        "text": "Nike",
        "image": "assets/logo/nike.png",
        "subtext": "Giày thể thao"
      },
      {
        "text": "Adidas",
        "image": "assets/logo/adidas.png",
        "subtext": "Giày thể thao"
      },
      {
        "text": "Puma",
        "image": "assets/logo/puma.png",
        "subtext": "Giày thể thao"
      },
      {
        "text": "Asics",
        "image": "assets/logo/asics.png",
        "subtext": "Giày thể thao"
      },
    ];

    // Chia danh sách thành hai nhóm
    final int half = (categories.length / 2).ceil();
    final List<Map<String, String>> firstHalf = categories.sublist(0, half);
    final List<Map<String, String>> secondHalf = categories.sublist(half);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10), // Khoảng cách lề
      child: Row(
        children: [
          // Cột đầu tiên
          Expanded(
            child: Column(
              children: [
                for (var category in firstHalf)
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 5), // Khoảng cách giữa các ô
                    padding: EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10), // Padding bên trong ô
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15), // Bo góc của ô
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1), // Đổi hướng bóng
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          category["image"]!,
                          width: 30, // Kích thước hình ảnh
                          height: 30, // Kích thước hình ảnh
                        ),
                        SizedBox(width: 10), // Khoảng cách giữa hình và chữ
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category["text"]!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12, // Kích thước chữ lớn
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      5), // Khoảng cách giữa chữ lớn và chữ nhỏ
                              Text(
                                category["subtext"]!,
                                style: TextStyle(
                                  fontSize: 10, // Kích thước chữ nhỏ
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: 20), // Khoảng cách giữa hai cột
          // Cột thứ hai
          Expanded(
            child: Column(
              children: [
                for (var category in secondHalf)
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 5), // Khoảng cách giữa các ô
                    padding: EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10), // Padding bên trong ô
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15), // Bo góc của ô
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1), // Đổi hướng bóng
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          category["image"]!,
                          width: 30, // Kích thước hình ảnh
                          height: 30, // Kích thước hình ảnh
                        ),
                        SizedBox(width: 10), // Khoảng cách giữa hình và chữ
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                category["text"]!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12, // Kích thước chữ lớn
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      5), // Khoảng cách giữa chữ lớn và chữ nhỏ
                              Text(
                                category["subtext"]!,
                                style: TextStyle(
                                  fontSize: 10, // Kích thước chữ nhỏ
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
