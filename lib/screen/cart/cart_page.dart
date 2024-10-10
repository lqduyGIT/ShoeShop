import 'package:flutter/material.dart';

// Import các widget cần thiết cho trang giỏ hàng
import 'widgets_cart/cart_app_bar.dart';
import 'widgets_cart/cart_bottom_navbar.dart';
import 'widgets_cart/cart_item_sample.dart';

// Trang giỏ hàng
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(), // Thanh công cụ trên cùng của trang giỏ hàng
          Container(
            height: 700, // Chiều cao của phần chứa giỏ hàng
            padding: EdgeInsets.only(top: 15), // Khoảng cách trên
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2), // Màu nền của phần chứa giỏ hàng
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), // Bo góc phần trên bên trái
                topRight: Radius.circular(35), // Bo góc phần trên bên phải
              ),
            ),
            child: Column(
              children: [
                CartItemSamples(), // Widget hiển thị các mặt hàng trong giỏ hàng
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:
          CartBottomNavBar(), // Thanh điều hướng dưới cùng của trang giỏ hàng
    );
  }
}
