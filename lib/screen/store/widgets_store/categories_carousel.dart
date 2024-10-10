import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoriesCarousel extends StatelessWidget {
  const CategoriesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    // Danh sách chứa các danh mục
    final List<String> categories = [
      "NAM",
      "NỮ",
      "TRẺ EM",
      "THỂ THAO",
    ];

    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: 10, vertical: 10), // Khoảng cách lề
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider.builder(
            itemCount: categories.length,
            itemBuilder: (context, index, realIndex) {
              final category = categories[index];
              return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 5), // Khoảng cách giữa các ô
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20), // Padding nhỏ hơn
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // Bo góc nhỏ hơn
                ),
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Kích thước chữ
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 60, // Chiều cao của carousel
              enlargeCenterPage: true, // Phóng to trang hiện tại
              autoPlay: false, // Tắt tự động phát
              viewportFraction:
                  0.4, // Phần trăm hiển thị của carousel (giảm giá trị để làm nhỏ hơn)
              initialPage: 0,
              enableInfiniteScroll: false, // Không cuộn vô hạn
              scrollDirection: Axis.horizontal, // Hướng cuộn
            ),
          ),
        ],
      ),
    );
  }
}
