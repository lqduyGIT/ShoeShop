import 'package:flutter/material.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Or Divider
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 34), // Khoảng cách dưới cùng
          child: Align(
            alignment: Alignment.topCenter, // Căn giữa theo chiều ngang
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Căn giữa các phần tử trong hàng
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Căn giữa theo chiều dọc
              children: [
                // Dòng kẻ bên trái của văn bản
                Container(
                  margin:
                      EdgeInsets.fromLTRB(0, 0, 4, 0), // Khoảng cách bên phải
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xE0939393), // Màu xám nhạt
                    ),
                    child: Container(
                      width: 104, // Chiều rộng của dòng kẻ
                      height: 1, // Chiều cao của dòng kẻ
                    ),
                  ),
                ),
                // Văn bản "Đăng nhập với"
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 2), // Khoảng cách bên trái và phải
                  child: Text(
                    'Hoặc đăng ký với',
                    style: TextStyle(
                      fontFamily: 'Poppins', // Font chữ
                      fontWeight: FontWeight.w500, // Đậm của font
                      fontSize: 12, // Kích thước chữ
                      color: Color(0xE0939393), // Màu chữ xám nhạt
                    ),
                  ),
                ),
                // Dòng kẻ bên phải của văn bản
                Container(
                  margin:
                      EdgeInsets.fromLTRB(4, 0, 0, 0), // Khoảng cách bên trái
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xE0939393), // Màu xám nhạt
                    ),
                    child: Container(
                      width: 104, // Chiều rộng của dòng kẻ
                      height: 1, // Chiều cao của dòng kẻ
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Phần hiển thị các biểu tượng mạng xã hội
        Align(
          alignment: Alignment.bottomCenter, // Căn giữa theo chiều ngang
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Căn giữa các phần tử trong hàng
            children: [
              // Nút hình tròn cho Facebook
              GestureDetector(
                onTap: () {
                  // Thêm hành động đăng nhập Facebook ở đây
                },
                child: Container(
                  width: 50, // Chiều rộng của nút
                  height: 50, // Chiều cao của nút
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Hình dạng nút là hình tròn
                    border: Border.all(
                      color: Colors.grey, // Màu viền xám
                      width: 1, // Độ dày viền
                    ),
                  ),
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent, // Màu nền trong suốt
                      child: InkWell(
                        splashColor: Colors.grey
                            .withOpacity(0.2), // Màu hiệu ứng khi nhấn
                        child: Image.asset(
                          'assets/images/facebooklogo.png', // Đường dẫn hình ảnh
                          width: 50, // Chiều rộng của hình ảnh
                          height: 50, // Chiều cao của hình ảnh
                        ),
                        onTap: () {
                          // Thêm hành động đăng nhập Facebook ở đây
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15), // Khoảng cách giữa các nút
              // Nút hình tròn cho Google
              GestureDetector(
                onTap: () {
                  // Thêm hành động đăng nhập Google ở đây
                },
                child: Container(
                  width: 50, // Chiều rộng của nút
                  height: 50, // Chiều cao của nút
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Hình dạng nút là hình tròn
                    border: Border.all(
                      color: Colors.grey, // Màu viền xám
                      width: 1, // Độ dày viền
                    ),
                  ),
                  child: ClipOval(
                    child: Material(
                      color: Colors.transparent, // Màu nền trong suốt
                      child: InkWell(
                        splashColor: Colors.grey
                            .withOpacity(0.2), // Màu hiệu ứng khi nhấn
                        child: Image.asset(
                          'assets/images/googlelogo.png', // Đường dẫn hình ảnh
                          width: 50, // Chiều rộng của hình ảnh
                          height: 50, // Chiều cao của hình ảnh
                        ),
                        onTap: () {
                          // Thêm hành động đăng nhập Google ở đây
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
