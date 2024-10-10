import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hd_shoesshop/product/productlist.dart';
import 'package:hd_shoesshop/screen/store/widgets_store/categories_brand.dart';
import 'package:hd_shoesshop/screen/store/widgets_store/categories_carousel.dart';
import 'package:hd_shoesshop/screen/store/widgets_store/items_store.dart';
import 'package:hd_shoesshop/screen/store/widgets_store/store_app_bar.dart';

import '../../model/product.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
   int _currentIndex = 0;
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    loadProductsFromJson(); // Tải dữ liệu từ JSON
  }

  Future<void> loadProductsFromJson() async {
    final String response = await rootBundle.loadString('assets/files/productlist.json');
    final data = jsonDecode(response);

    // Kiểm tra cấu trúc JSON
    if (data['data'] != null) {
      final List<ProductModel> loadedProducts = (data['data'] as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();

      setState(() {
        products = loadedProducts;
      });
    } else {
      print('Data is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        StoreAppBar(),
        // Thanh công cụ trên cùng
        Container(
          padding: const EdgeInsets.only(top: 15), // Khoảng cách trên
          decoration: const BoxDecoration(
            color: Color(0xFFEDECF2), // Màu nền của phần nội dung
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), // Bo góc phần trên bên trái
              topRight: Radius.circular(35), // Bo góc phần trên bên phải
            ),
          ),
          child: Column(
            children: [
              // Widget tìm kiếm
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 15), // Khoảng cách bên trái và phải
                padding: const EdgeInsets.symmetric(
                    horizontal: 15), // Khoảng cách bên trong
                height: 50, // Chiều cao của widget tìm kiếm
                decoration: BoxDecoration(
                  color: Colors.white, // Màu nền của widget tìm kiếm
                  borderRadius:
                      BorderRadius.circular(30), // Bo góc của widget tìm kiếm
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 5), // Khoảng cách bên trái của trường tìm kiếm
                      height: 50,
                      width: 300, // Chiều rộng của trường tìm kiếm
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none, // Không có viền
                          hintText: "Tìm kiếm tại cửa hàng...", // Văn bản gợi ý
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.camera_alt) // Biểu tượng máy ảnh
                  ],
                ),
              ),
              // Tiêu đề "Danh mục sản phẩm"
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 10), // Khoảng cách trên và dưới
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, // Đặt khoảng cách đều giữa các phần tử
                  children: const [
                    Text(
                      "Thương hiệu nổi bật",
                      style: TextStyle(
                        fontSize: 22, // Kích thước chữ
                        fontWeight: FontWeight.bold, // Độ đậm chữ
                        color: Colors.black, // Màu chữ
                      ),
                    ),
                    Text(
                      "Xem tất cả",
                      style: TextStyle(
                        fontSize: 14, // Kích thước chữ
                        fontWeight: FontWeight.w300, // Kiểu chữ mỏng
                        color: Color(0xFF7357a4), // Màu chữ xanh
                      ),
                    ),
                  ],
                ),
              ),
              // Widget sản phẩm
              const CategoriesBrand(),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 10), // Khoảng cách trên và dưới
                child: const Text(
                  "Sản phẩm dành cho",
                  style: TextStyle(
                    fontSize: 22, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Độ đậm chữ
                    color: Colors.black, // Màu chữ
                  ),
                ),
              ),
              const CategoriesCarousel(),
              ItemsStore(products: products),
            ],
          ),
        ),
      ],
    );
  }
}
