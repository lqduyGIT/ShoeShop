import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth để xử lý đăng nhập
import 'package:flutter/material.dart'; // Import Flutter Material package cho giao diện
import 'package:hd_shoesshop/screen/home/home_screen.dart';
import '../../signup/signup_screen.dart'; // Import màn hình đăng ký
import 'password_reset.dart'; // Import màn hình khôi phục mật khẩu

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() =>
      _LoginFormState(); // Tạo trạng thái cho LoginForm
}

class _LoginFormState extends State<LoginForm> {
  bool _isChecked = false; // Trạng thái của checkbox lưu mật khẩu
  final TextEditingController _emailController =
      TextEditingController(); // Controller cho trường email
  final TextEditingController _passwordController =
      TextEditingController(); // Controller cho trường mật khẩu
  bool _obscurePassword = true; // Trạng thái hiển thị mật khẩu (ẩn hay hiện)

  final FocusNode _emailFocusNode = FocusNode(); // FocusNode cho trường email
  final FocusNode _passwordFocusNode =
      FocusNode(); // FocusNode cho trường mật khẩu

  @override
  void initState() {
    super.initState();
    // Lắng nghe sự thay đổi focus của trường email và mật khẩu
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Giải phóng tài nguyên khi không còn sử dụng
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  // Hàm đăng nhập
  signIn() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Vui lòng nhập email và mật khẩu')), // Thông báo lỗi khi chưa nhập email hoặc mật khẩu
      );
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Chuyển hướng đến trang Homepage khi đăng nhập thành công
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } catch (e) {
      // Xử lý lỗi đăng nhập
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Đăng nhập thất bại: ${e.toString()}')), // Thông báo lỗi đăng nhập không thành công
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Trường Email
        Padding(
          padding: EdgeInsets.fromLTRB(
              14, 20, 14, 20), // Tăng khoảng cách trên và dưới
          child: TextField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            decoration: InputDecoration(
              hintText: 'Email',
              labelText: 'Email',
              labelStyle: TextStyle(
                  fontSize: 13, color: Colors.black), // Style của label
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: const Color(0xFF939393)), // Viền của TextField
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/direct-right.png', // Icon cho trường email
                  width: 18.6,
                  height: 18.6,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),

        // Trường Mật khẩu
        Padding(
          padding: EdgeInsets.fromLTRB(14, 0, 14, 25), // Tăng khoảng cách dưới
          child: TextField(
            controller: _passwordController,
            obscureText: _obscurePassword, // Ẩn hoặc hiện mật khẩu
            focusNode: _passwordFocusNode,
            decoration: InputDecoration(
              hintText: 'Mật khẩu',
              labelText: 'Mật khẩu',
              labelStyle: TextStyle(
                  fontSize: 13, color: Colors.black), // Style của label
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                    color: const Color(0xFF939393)), // Viền của TextField
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/password-check.png', // Icon cho trường mật khẩu
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.remove_red_eye
                      : Icons
                          .security, // Biểu tượng thay đổi tùy theo trạng thái mật khẩu
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

        // Các lựa chọn lưu mật khẩu và quên mật khẩu
        Container(
          margin: EdgeInsets.fromLTRB(35, 0, 35, 22), // Căn lề cho container
          child: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 303, // Chiều rộng của container
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value:
                            _isChecked, // Trạng thái của checkbox lưu mật khẩu
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ??
                                false; // Cập nhật trạng thái của checkbox
                          });
                        },
                        checkColor: Colors.white, // Màu của dấu check
                        activeColor: Color.fromARGB(
                            255, 0, 0, 0), // Màu nền của checkbox khi được chọn
                      ),
                      Text(
                        'Lưu mật khẩu',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PasswordResetPage(), // Chuyển đến trang khôi phục mật khẩu
                        ),
                      );
                    },
                    child: Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: const Color(0xFFA496C8), // Màu chữ của liên kết
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Nút đăng nhập
        Container(
          margin: EdgeInsets.fromLTRB(14, 0, 14, 25), // Căn lề cho container
          decoration: BoxDecoration(
            color: const Color(0xFF232323), // Màu nền của nút
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Color.fromARGB(255, 0, 0, 0), // Màu viền của nút
              width: 2,
            ), // Bo góc nút
          ),
          child: TextButton(
            onPressed: () => signIn(), // Gọi hàm đăng nhập khi nhấn nút
            child: SizedBox(
              width: double.infinity,
              height: 25,
              child: Center(
                child: Text(
                  'Đăng nhập',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.white, // Màu chữ của nút
                  ),
                ),
              ),
            ),
          ),
        ),

        // Nút tạo tài khoản
        Container(
          margin: EdgeInsets.fromLTRB(14, 0, 14, 25), // Căn lề cho container
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255), // Màu nền của nút
            borderRadius: BorderRadius.circular(15), // Bo góc nút
            border: Border.all(
              color: const Color(0xFF939393), // Màu viền của nút
              width: 2,
            ),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SignupScreen(), // Chuyển đến màn hình đăng ký
                ),
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: EdgeInsets.zero,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 25,
              child: Center(
                child: Text(
                  'Tạo tài khoản',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color:
                        const Color.fromARGB(255, 0, 0, 0), // Màu chữ của nút
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
