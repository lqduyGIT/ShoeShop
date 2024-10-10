import 'package:flutter/material.dart';
import 'package:hd_shoesshop/screen/wishlist/widgets_wishlist/items_wishlist.dart';
import 'package:hd_shoesshop/screen/wishlist/widgets_wishlist/wishlist_app_bar.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          WishlistAppBar(),
          // Thanh công cụ trên cùng
          Container(
            padding:
                EdgeInsets.only(top: 15, bottom: 15), // Padding trên và dưới
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2), // Màu nền của phần nội dung
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35), // Bo góc phần trên bên trái
                topRight: Radius.circular(35), // Bo góc phần trên bên phải
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thêm các widget khác nếu cần
                ItemsWishlist(), // Widget hiển thị danh sách sản phẩm yêu thích
              ],
            ),
          ),
        ],
      ),
    );
  }
}
