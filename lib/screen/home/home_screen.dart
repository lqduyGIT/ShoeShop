import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:carousel_slider/carousel_slider.dart'; // Import CarouselSlider package
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hd_shoesshop/screen/home/widgets_home/categories_widget.dart';
import 'package:hd_shoesshop/screen/home/widgets_home/items_home.dart';
import 'package:hd_shoesshop/screen/store/store_screen.dart';
import 'package:hd_shoesshop/screen/wishlist/wishlist_screen.dart';
import '../../model/product.dart';
import '../profile/profile_screen.dart';
import 'widgets_home/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0; // Chỉ số của trang hiện tại
  final PageController _pageController =
      PageController(); // Controller để điều khiển PageView

  // Danh sách các trang để hiển thị trong PageView
  final List<Widget> _pages = [
    HomeContent(),
    StoreScreen(),
    WishList(),
    ProfileScreen(),
    // Add other pages here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController, // Controller để điều khiển PageView
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index; // Cập nhật chỉ số trang khi thay đổi
          });
        },
        children: _pages, // Sử dụng danh sách các trang
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent, // Màu nền của thanh điều hướng
        onTap: (index) {
          setState(() {
            _pageIndex = index; // Cập nhật chỉ số khi chọn một mục
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300), // Thời gian chuyển trang
            curve: Curves.easeInOut, // Hiệu ứng chuyển trang
          );
        },
        height: 70, // Chiều cao của thanh điều hướng
        color: Colors.black, // Màu nền của thanh điều hướng
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white, // Màu của biểu tượng
          ),
          Icon(
            Icons.store,
            size: 30,
            color: Colors.white, // Màu của biểu tượng
          ),
          Icon(
            Icons.favorite_outline_rounded,
            size: 30,
            color: Colors.white, // Màu của biểu tượng
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white, // Màu của biểu tượng
          ),
        ],
        index: _pageIndex, // Chỉ số trang hiện tại
      ),
    );
  }
}

// Widget chính của trang nội dung chính
class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
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
        HomeAppBar(),
        // Thanh công cụ trên cùng
        Container(
          padding: EdgeInsets.only(top: 15), // Khoảng cách trên
          decoration: BoxDecoration(
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
                margin: EdgeInsets.symmetric(horizontal: 15), // Khoảng cách bên trái và phải
                padding: EdgeInsets.symmetric(horizontal: 15), // Khoảng cách bên trong
                height: 50, // Chiều cao của widget tìm kiếm
                decoration: BoxDecoration(
                  color: Colors.white, // Màu nền của widget tìm kiếm
                  borderRadius: BorderRadius.circular(30), // Bo góc của widget tìm kiếm
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5), // Khoảng cách bên trái của trường tìm kiếm
                      height: 50,
                      width: 300, // Chiều rộng của trường tìm kiếm
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none, // Không có viền
                          hintText: "Tìm kiếm tại cửa hàng...", // Văn bản gợi ý
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.camera_alt) // Biểu tượng máy ảnh
                  ],
                ),
              ),
              // Tiêu đề "Danh mục sản phẩm"
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10), // Khoảng cách trên và dưới
                child: Text(
                  "Danh mục sản phẩm",
                  style: TextStyle(
                    fontSize: 25, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Độ đậm chữ
                    color: Colors.black, // Màu chữ
                  ),
                ),
              ),
              // Widget danh mục
              Categorieswidget(),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10), // Khoảng cách trên và dưới
                child: Text(
                  "Tin tức phổ biển",
                  style: TextStyle(
                    fontSize: 25, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Độ đậm chữ
                    color: Colors.black, // Màu chữ
                  ),
                ),
              ),
              // Banner có thể kéo qua với dots
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200, // Chiều cao của banner
                        autoPlay: true, // Tự động phát
                        enlargeCenterPage: true, // Phóng to trang hiện tại
                        aspectRatio: 16 / 9, // Tỉ lệ khung hình
                        viewportFraction: 0.9, // Tỷ lệ xem của trang
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index; // Cập nhật chỉ số khi trang thay đổi
                          });
                        },
                      ),
                      items: [
                        'assets/images/banner/banner1.png',
                        'assets/images/banner/banner2.jpg',
                        'assets/images/banner/banner3.jpg',
                      ]
                          .map((item) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 10), // Khoảng cách giữa carousel và dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Dots indicators
                        for (int i = 0; i < 3; i++) // 3 là số lượng các banner
                          Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == i
                                  ? Colors.blueAccent
                                  : Colors.grey, // Màu dot cho trang hiện tại
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              // Tiêu đề "Sản phẩm phổ biến"
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10), // Khoảng cách trên và dưới
                child: Text(
                  "Sản phẩm phổ biến",
                  style: TextStyle(
                    fontSize: 25, // Kích thước chữ
                    fontWeight: FontWeight.bold, // Độ đậm chữ
                    color: Colors.black, // Màu chữ
                  ),
                ),
              ),
              // Widget sản phẩm
              ItemsWidget(products: products), // Chuyển danh sách sản phẩm vào widget
            ],
          ),
        ),
      ],
    );
  }
}