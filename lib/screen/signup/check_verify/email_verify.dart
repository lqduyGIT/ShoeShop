import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hd_shoesshop/screen/signup/check_verify/succes_verify.dart';
import 'dart:async';

// Widget xác minh email của người dùng
class EmailVerificationWidget extends StatefulWidget {
  @override
  _EmailVerificationWidgetState createState() => _EmailVerificationWidgetState();
}

class _EmailVerificationWidgetState extends State<EmailVerificationWidget> {
  final user = FirebaseAuth.instance.currentUser; // Lấy thông tin người dùng hiện tại
  bool isEmailVerified = false; // Trạng thái xác minh email
  Timer? timer; // Đối tượng Timer để kiểm tra trạng thái xác minh định kỳ

  @override
  void initState() {
    super.initState();
    // Kiểm tra xem email đã được xác minh chưa khi widget được khởi tạo
    isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;
    if (!isEmailVerified) {
      sendVerificationEmail(); // Gửi email xác minh nếu email chưa được xác minh
      // Đặt lịch kiểm tra email đã xác minh chưa sau mỗi 3 giây
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel(); // Hủy Timer khi widget bị hủy
    super.dispose();
  }

  // Hàm kiểm tra xem email đã được xác minh chưa
  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload(); // Tải lại thông tin người dùng
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false; // Cập nhật trạng thái xác minh
    });
    if (isEmailVerified) timer?.cancel(); // Hủy Timer nếu email đã được xác minh
  }

  // Hàm gửi email xác minh
  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification(); // Gửi email xác minh
    } catch (e) {
      // Xử lý lỗi khi gửi email xác minh
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF), // Màu nền trắng
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Thanh màu đen ở đầu trang
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 35),
              color: const Color(0xFF000000),
              width: double.infinity, // Chiều rộng toàn bộ màn hình
              height: 25,
            ),
            // Nút "X" để đóng trang
            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 40),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context); // Đóng trang khi nhấn nút
                },
              ),
            ),
            // Hình ảnh động thông báo người dùng kiểm tra email
            Container(
              margin: const EdgeInsets.fromLTRB(39, 0, 39, 45),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover, // Ảnh phủ kín container
                  image: AssetImage('assets/gif/checkmail.gif'),
                ),
              ),
              width: 314, // Chiều rộng của ảnh
              height: 236, // Chiều cao của ảnh
            ),
            // Tiêu đề hướng dẫn người dùng xác minh email
            Container(
              margin: const EdgeInsets.fromLTRB(28, 0, 28, 14),
              child: const Text(
                'Xác minh địa chỉ E-Mail của bạn',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600, // Độ đậm của font
                  fontSize: 20, // Kích thước chữ
                  color: Color(0xFF000000), // Màu chữ đen
                ),
              ),
            ),
            // Hiển thị email người dùng (nếu có)
            Container(
              margin: const EdgeInsets.fromLTRB(1, 0, 0, 14),
              child: Align(
                alignment: Alignment.topCenter,
                child: RichText(
                  text: TextSpan(
                    text: user?.email ?? 'Không có email',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold, // In đậm
                      fontSize: 15, // Kích thước chữ
                      color: Color(0xE0939393), // Màu chữ xám
                    ),
                  ),
                ),
              ),
            ),
            // Đoạn văn bản mô tả về lợi ích của việc xác minh email
            Container(
              margin: const EdgeInsets.fromLTRB(28, 0, 28, 15),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Chúc mừng! Tài khoản của bạn đang chờ để xác minh E-Mail để bắt đầu mua sắm và trải nghiệm vô số ưu đãi có một không hai và ưu đãi được cá nhân hóa!',
                  textAlign: TextAlign.justify, // Căn đều đoạn văn bản
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500, // Độ đậm của font
                    fontSize: 13, // Kích thước chữ
                    color: Color(0xE0939393), // Màu chữ xám
                  ),
                ),
              ),
            ),
            // Nút "Tiếp tục" hoặc "Đang đợi xác thực..." tùy thuộc vào trạng thái xác minh email
            Container(
              margin: const EdgeInsets.fromLTRB(14, 0, 14, 25),
              child: SizedBox(
                width: double.infinity, // Chiều rộng của nút chiếm toàn bộ container
                child: ElevatedButton(
                  onPressed: isEmailVerified
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AccountCreationSuccessWidget(),
                            ),
                          ); // Điều hướng đến trang thành công khi email đã được xác minh
                        }
                      : null, // Vô hiệu hóa nút nếu email chưa được xác minh
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEmailVerified ? Colors.black : Colors.grey, // Màu nền của nút
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Bo tròn góc nút
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2, // Độ dày của viền
                      ),
                    ),
                  ),
                  child: Text(
                    isEmailVerified ? 'Tiếp tục' : 'Đang đợi xác thực...', // Nội dung của nút
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500, // Độ đậm của font
                      fontSize: 18, // Kích thước chữ
                      color: Colors.white, // Màu chữ trắng
                    ),
                  ),
                ),
              ),
            ),
            // Nút "Gửi lại Email" để gửi lại email xác minh
            Container(
              margin: const EdgeInsets.fromLTRB(1, 0, 0, 50),
              child: TextButton(
                onPressed: isEmailVerified ? null : sendVerificationEmail, // Vô hiệu hóa nút nếu email đã được xác minh
                child: Text(
                  'Gửi lại Email',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500, // Độ đậm của font
                    fontSize: 13, // Kích thước chữ
                    color: isEmailVerified ? Colors.grey : Color(0xFFA496C8), // Màu chữ tùy thuộc vào trạng thái xác minh email
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
