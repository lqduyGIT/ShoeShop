import 'package:flutter/material.dart'; // Import Flutter Material package
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hd_shoesshop/screen/signup/widget_signup/signup_form.dart';

class PasswordResetPage extends StatefulWidget {
  @override
  _PasswordResetPageState createState() =>
      _PasswordResetPageState(); // Tạo trạng thái cho PasswordResetPage
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final TextEditingController _emailController = TextEditingController(); // Controller cho trường email
  final FocusNode _emailFocusNode = FocusNode(); // FocusNode cho trường email

  @override
  void dispose() {
    // Giải phóng tài nguyên khi không còn sử dụng
    _emailController.dispose();
    super.dispose();
  }

  reset() async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Chúng tôi đã gửi một liên kết xác thực đến Email của bạn!'),
        backgroundColor: Color(0xFF232323),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Có lỗi xảy ra: $e'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Màu nền của màn hình
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thanh trạng thái (có thể là logo hoặc thanh tiêu đề)
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25), // Căn lề dưới
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF000000), // Màu nền của thanh trạng thái
                ),
                child: Container(
                  width: double
                      .infinity, // Chiều rộng của thanh trạng thái mở rộng ra toàn bộ chiều rộng
                  height: 25,
                ),
              ),
            ),
            // Nút quay lại
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 22), // Căn lề
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.black, // Màu của biểu tượng quay lại
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Quay lại màn hình trước đó
                  },
                ),
              ),
            ),
            // Tiêu đề trang
            Container(
              margin: const EdgeInsets.fromLTRB(14, 0, 14, 11), // Căn lề
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Quên mật khẩu',
                  style: TextStyle(
                    fontFamily: 'Poppins', // Font chữ
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xFF000000), // Màu chữ tiêu đề
                  ),
                ),
              ),
            ),
            // Hướng dẫn nhập email
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 50), // Căn lề
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Đừng lo lắng đôi khi mọi người cũng có thể quên, hãy nhập email của bạn và chúng tôi sẽ gửi cho bạn liên kết đặt lại mật khẩu.',
                  style: TextStyle(
                    fontFamily: 'Poppins', // Font chữ
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Color(0xE0939393), // Màu chữ hướng dẫn
                  ),
                ),
              ),
            ),
            // Trường nhập email
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  14, 5, 14, 20), // Căn lề và khoảng cách
              child: TextField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                  labelStyle: const TextStyle(
                      fontSize: 13, color: Colors.black), // Style của label
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15), // Bo góc của TextField
                    borderSide: const BorderSide(
                        color: Color(0xFF939393)), // Màu viền
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/direct-right.png', // Icon trước trường email
                      width: 18.6,
                      height: 18.6,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            // Nút gửi liên kết đặt lại mật khẩu
            Container(
  margin: const EdgeInsets.fromLTRB(14, 0, 14, 25), // Căn lề
  child: SizedBox(
    width: double.infinity, // Chiều rộng của nút mở rộng toàn bộ chiều rộng
    child: ElevatedButton(
      onPressed: () {
        reset(); // Gọi hàm gửi email khi nhấn nút
        
        // Hiển thị thông báo khi nút được nhấn
        
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF232323), // Màu nền của nút
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Bo góc của nút
        ),
        padding: const EdgeInsets.symmetric(vertical: 15), // Padding dọc
        elevation: 0, // Loại bỏ hiệu ứng bóng
      ),
      child: const Text(
        'Gửi',
        style: TextStyle(
          fontFamily: 'Poppins', // Font chữ
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: Color(0xFFFFFFFF), // Màu chữ của nút
        ),
      ),
    ),
  ),
)
,
          ],
        ),
      ),
    );
  }
}
