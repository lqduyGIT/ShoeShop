import 'package:flutter/material.dart';
import 'package:hd_shoesshop/screen/profile/widgets_profile/profile_app_bar.dart';

import 'widgets_profile/profile_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProfileAppBar(),
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
                ProfileContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
