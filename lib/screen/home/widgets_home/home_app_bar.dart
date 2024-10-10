import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

// Định nghĩa lớp HomeAppBar kế thừa StatelessWidget
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key}); // Constructor của HomeAppBar

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Màu nền của AppBar
      padding: const EdgeInsets.all(25), // Khoảng cách bên trong AppBar
      child: Row(
        children: [
          // Biểu tượng "sort" bên trái
          const Icon(
            Icons.sort,
            size: 30, // Kích thước biểu tượng
            color: Colors.black, // Màu biểu tượng
          ),
          const Padding(
            padding:
                EdgeInsets.only(left: 20), // Khoảng cách bên trái của tiêu đề
            child: Text(
              "HDStore", // Tiêu đề của AppBar
              style: TextStyle(
                fontSize: 23, // Kích thước chữ tiêu đề
                fontWeight: FontWeight.bold, // Độ đậm chữ
                color: Colors.black, // Màu chữ tiêu đề
              ),
            ),
          ),
          const Spacer(), // Khoảng trống giữa tiêu đề và biểu tượng giỏ hàng
          // Biểu tượng giỏ hàng với badge thông báo số lượng
          badges.Badge(
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red, // Màu nền của badge
              padding: EdgeInsets.all(7), // Khoảng cách bên trong badge
            ),
            badgeContent: const Text(
              "3", // Nội dung của badge, số lượng hàng trong giỏ
              style: TextStyle(color: Colors.white), // Màu chữ trong badge
            ),
            child: InkWell(
              onTap: () {
                // Điều hướng đến trang giỏ hàng khi nhấp vào biểu tượng
                Navigator.pushNamed(context, "cartPage");
              },
              child: const Icon(
                Icons.shopping_bag_outlined, // Biểu tượng giỏ hàng
                size: 32, // Kích thước biểu tượng
                color: Colors.black, // Màu biểu tượng
              ),
            ),
          ),
        ],
      ),
    );
  }
}
