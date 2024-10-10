import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../home/home_screen.dart';


// Widget hiển thị thông báo thành công sau khi tạo tài khoản
class AccountCreationSuccessWidget extends StatelessWidget {
  const AccountCreationSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin người dùng hiện tại từ Firebase Authentication
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),  // Đặt màu nền cho màn hình
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,  // Căn chỉnh các widget trong cột theo chiều dọc (bắt đầu từ trên cùng)
        crossAxisAlignment: CrossAxisAlignment.center,  // Căn chỉnh các widget trong cột theo chiều ngang (ở giữa)
        children: [
          // Phần trên cùng của màn hình (để chừa khoảng cách)
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),  // Đặt khoảng cách từ trên xuống
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF000000),  // Màu nền đen cho phần trên cùng
              ),
              width: 393,  // Chiều rộng của phần trên cùng
              height: 25,  // Chiều cao của phần trên cùng
            ),
          ),
          // Hình ảnh động hoặc ảnh minh họa hiển thị trong phần thông báo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,  // Đặt kích thước ảnh phủ kín container
                image: AssetImage('assets/gif/nicedone.gif'),  // Đường dẫn đến ảnh động
              ),
            ),
            width: 457,  // Chiều rộng của ảnh
            height: 343,  // Chiều cao của ảnh
          ),
          // Thông báo tiêu đề chính "Tài khoản của bạn đã tạo thành công!"
          Container(
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 20),  // Đặt khoảng cách từ các cạnh của container
            child: const Text(
              'Tài khoản của bạn đã tạo thành công!',
              textAlign: TextAlign.center,  // Căn giữa văn bản
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,  // Độ đậm của font
                fontSize: 24,  // Kích thước chữ
                color: Color(0xFF000000),  // Màu chữ đen
              ),
            ),
          ),
          // Đoạn văn bản chào mừng, bao gồm email của người dùng được in đậm
          Container(
            margin: const EdgeInsets.fromLTRB(28, 0, 28, 20),  // Đặt khoảng cách từ các cạnh của container
            child: Text.rich(
              TextSpan(
                text: 'Chào mừng ',  // Phần đầu của câu
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,  // Độ đậm của font
                  fontSize: 15,  // Kích thước chữ
                  color: Color(0xE0939393),  // Màu chữ xám
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: user?.email,  // Email của người dùng (được in đậm)
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,  // In đậm
                      fontSize: 15,
                      color: Color(0xE0939393),  // Màu chữ xám
                    ),
                  ),
                  TextSpan(
                    text: ' đến với HuyDuy Store: Tài khoản của bạn đã được tạo, hãy thỏa sức đam mê mua sắm của bạn tại đây!',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,  // Độ đậm của font
                      fontSize: 15,  // Kích thước chữ
                      color: Color(0xE0939393),  // Màu chữ xám
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,  // Căn giữa văn bản
            ),
          ),
          // Nút "Tiếp tục" để điều hướng đến trang chủ
          Container(
            margin: const EdgeInsets.fromLTRB(14, 0, 14, 25),  // Đặt khoảng cách từ các cạnh của container
            child: SizedBox(
              width: double.infinity,  // Đặt nút chiếm toàn bộ chiều rộng container
              child: ElevatedButton(
                onPressed: () {
                  // Điều hướng đến trang chủ khi nhấn nút
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,  // Màu nền của nút
                  padding: const EdgeInsets.symmetric(vertical: 10),  // Đệm dọc cho nút
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),  // Góc bo tròn của nút
                    side: const BorderSide(
                      color: Colors.black,  // Viền đen của nút
                      width: 2,  // Độ dày của viền
                    ),
                  ),
                ),
                child: const Text(
                  'Tiếp tục',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,  // Độ đậm của font
                    fontSize: 18,  // Kích thước chữ
                    color: Colors.white,  // Màu chữ trắng
                  ),
                ),
              ),
            ),
          ),
          // Tùy chọn "Gửi lại Email" cho người dùng
          Container(
            margin: const EdgeInsets.fromLTRB(1, 0, 0, 108),  // Đặt khoảng cách từ các cạnh của container
            child: const Text(
              'Gửi lại Email',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,  // Độ đậm của font
                fontSize: 13,  // Kích thước chữ
                color: Color(0xFFA496C8),  // Màu chữ tím nhạt
              ),
            ),
          ),
        ],
      ),
    );
  }
}
