import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:hd_shoesshop/model/UserInfoProvider.dart';
import '../check_verify/email_verify.dart';

class SignupFormWidget extends StatefulWidget {
  const SignupFormWidget({super.key});

  @override
  _SignupFormWidgetState createState() => _SignupFormWidgetState();
}



class _SignupFormWidgetState extends State<SignupFormWidget> {
  // Khai báo các TextEditingController bên trong lớp State
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController passWord = TextEditingController();

  bool _isChecked = false; // Trạng thái của checkbox
  bool _obscurePassword = true; // Trạng thái hiển thị mật khẩu

  @override
  void dispose() {
    // Giải phóng các TextEditingController khi widget bị loại bỏ khỏi cây widget
    firstName.dispose();
    lastName.dispose();
    userName.dispose();
    phoneNumber.dispose();
    email.dispose();
    passWord.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
  if (firstName.text.trim().isEmpty ||
      lastName.text.trim().isEmpty ||
      userName.text.trim().isEmpty ||
      email.text.trim().isEmpty ||
      phoneNumber.text.trim().isEmpty ||
      passWord.text.isEmpty) {
    Get.snackbar(
      'Lỗi',
      'Vui lòng nhập đầy đủ các trường',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return;
  }

  if (!_isChecked) {
    Get.snackbar(
      '--> Thông báo',
      'Vui lòng đồng ý với các điều khoản sử dụng và chính sách quyền riêng tư',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    return;
  }

  try {
    // Tạo tài khoản với Firebase Authentication
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: passWord.text,
    );

    // Lưu thông tin người dùng vào UserInfoProvider
    Provider.of<UserInfoProvider>(context, listen: false).updateUserInfo(
      firstName.text.trim(),
      lastName.text.trim(),
      phoneNumber.text.trim(),
      userName.text.trim(),
    );

    // Gửi email xác thực
    await userCredential.user?.sendEmailVerification();

    // Điều hướng đến trang xác thực email
    Get.offAll(() => EmailVerificationWidget());

    Get.snackbar(
      'Thành công',
      'Đăng ký thành công! Vui lòng kiểm tra email của bạn để xác thực.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  } on FirebaseAuthException catch (e) {
    String errorMessage;
    switch (e.code) {
      case 'weak-password':
        errorMessage = 'Mật khẩu quá yếu';
        break;
      case 'email-already-in-use':
        errorMessage = 'Email đã tồn tại';
        break;
      case 'invalid-email':
        errorMessage = 'Email không hợp lệ';
        break;
      default:
        errorMessage = 'Đã xảy ra lỗi khi đăng ký: ${e.message}';
    }
    Get.snackbar(
      'Lỗi',
      errorMessage,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  } catch (e) {
    Get.snackbar(
      'Lỗi',
      'Đã xảy ra lỗi không xác định: $e',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Name and Surname Fields
        Container(
          margin: const EdgeInsets.fromLTRB(14, 0, 15, 17),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: firstName,
                  decoration: InputDecoration(
                    labelText: "Tên",
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF333333),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xFF939393)),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/images/user.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextField(
                  controller: lastName,
                  decoration: InputDecoration(
                    labelText: "Họ",
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF333333),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xFF939393)),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/images/user.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

// Username Field
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 16, 17),
          child: TextField(
            controller: userName,
            decoration: InputDecoration(
              labelText: "Tên người dùng",
              labelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF333333),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xFF939393)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/user-edit.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),

// Email Field
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 16, 17),
          child: TextField(
            controller: email,
            decoration: InputDecoration(
              labelText: "E-Mail",
              labelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF333333),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xFF939393)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/direct-right.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),

// Phone Number Field
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 16, 17),
          child: TextField(
            controller: phoneNumber,
            decoration: InputDecoration(
              labelText: "Số điện thoại",
              labelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF333333),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xFF939393)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/call.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ),

// Password Field
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 16, 19),
          child: TextField(
            controller: passWord,
            obscureText: _obscurePassword, // Để che giấu mật khẩu
            decoration: InputDecoration(
              labelText: "Mật khẩu",
              labelStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF333333),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Color(0xFF939393)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/password-check.png',
                  width: 24,
                  height: 24,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off, // Biểu tượng thay đổi
                  size: 24,
                  color: const Color(0xFF333333),
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword =
                        !_obscurePassword; // Thay đổi trạng thái hiển thị mật khẩu
                  });
                },
              ),
            ),
          ),
        ),

        // Terms and Conditions
        Container(
  margin: const EdgeInsets.fromLTRB(34.5, 0, 34.5, 18.3), // Khoảng cách bên ngoài của Container
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start, // Đảm bảo các phần tử trong hàng được căn chỉnh về phía trái
    crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh các phần tử con theo đầu dòng
    children: [
      // Container bao quanh Checkbox để căn chỉnh chính xác
      Container(
        margin: const EdgeInsets.only(right: 15), // Khoảng cách giữa checkbox và văn bản bên cạnh
        child: Checkbox(
          value: _isChecked, // Trạng thái của checkbox
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false; // Cập nhật trạng thái của checkbox
            });
          },
          checkColor: Colors.white, // Màu của dấu check
          activeColor: Colors.black, // Màu nền của checkbox khi được chọn
          side: const BorderSide(
            color: Colors.black, // Màu viền của checkbox
            width: 2.0, // Độ dày của viền
          ),
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn chỉnh các phần tử con theo đầu dòng trong cột
          children: [
            Row(
              children: [
                const Text(
                  'Tôi đồng ý với',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(width: 4), // Khoảng cách giữa các từ
                GestureDetector(
                  onTap: () {
                    // Action khi nhấn vào "Chính sách quyền riêng tư"
                    // Ví dụ: mở trang chính sách quyền riêng tư
                  },
                  child: const Text(
                    'Chính sách quyền riêng tư',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Color(0xFF1976D2),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2), // Khoảng cách giữa các hàng
            Row(
              children: [
                const Text(
                  'và',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(width: 4), // Khoảng cách giữa các từ
                GestureDetector(
                  onTap: () {
                    // Action khi nhấn vào "Điều khoản sử dụng"
                    // Ví dụ: mở trang điều khoản sử dụng
                  },
                  child: const Text(
                    'Điều khoản sử dụng',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Color(0xFF1976D2),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
),
        // Signup Button
        Container(
          margin:
              const EdgeInsets.fromLTRB(14, 0, 14, 25), // Khoảng cách xung quanh nút
          child: SizedBox(
            width:
                double.infinity, // Đặt chiều rộng của nút để mở rộng về hai bên
            child: ElevatedButton(
              onPressed: () => signUp(),

              //thêm lệnh gửi link xác thực email FBase,
              //hiện thêm thông báo từ link xác thực để nhấp quay về trang tạo thành công


                // Thực hiện điều hướng sang widget EmailVerificationWidget
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => EmailVerificationWidget()),
                // );
              // },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Nền đen của nút
                padding: const EdgeInsets.symmetric(
                    vertical:
                        10), // Điều chỉnh padding để thay đổi kích thước nút
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                    color: Colors.black, // Màu viền đen
                    width: 2,
                  ),
                ),
              ),
              child: const Text(
                'Tạo tài khoản',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white, // Màu chữ trắng
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
