import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

TextEditingController email=TextEditingController();

@override
  void dispose() {
    // Giải phóng tài nguyên khi không còn sử dụng
    email.dispose();
    super.dispose();
  }

reset()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFF000000), // Màu nền đen
          width: 393, // Chiều rộng của thanh
          height: 25, // Chiều cao của thanh
        ),
         Container(
          margin: EdgeInsets.fromLTRB(
              14, 0, 14, 6), // Khoảng cách từ các cạnh (trái, phải, dưới)
          child: Align(
            alignment: Alignment.topLeft, // Căn lề bên trái
            child: Text(
              'Quên mật khẩu',
              style: TextStyle(
                fontWeight: FontWeight.w600, // Độ đậm của chữ
                fontSize: 25, // Kích thước chữ
                color: const Color(0xFF333333), // Màu chữ
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
              14, 0, 14, 11), // Khoảng cách từ các cạnh (trái, phải, dưới)
          child: Align(
            alignment: Alignment.topLeft, // Căn lề bên trái
            child: Text(
              'Đừng lo lắng đôi khi mọi người cũng có thể quên, hãy nhập email của bạn và chúng tôi sẽ gửi cho bạn liên kết đặt lại mật khẩu.',
              style: TextStyle(
                fontWeight: FontWeight.w300, // Độ đậm của chữ
                fontSize: 13, // Kích thước chữ
                color: const Color(0xE0232323), // Màu chữ
              ),
            ),
          ),
        ),
        // Trường Email
        Padding(
          padding: EdgeInsets.fromLTRB(14, 20, 14, 20), // Tăng khoảng cách trên và dưới
          child: TextField(
            controller: email,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                fontSize: 13, 
                color: Colors.black, // Style của label
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: const Color(0xFF939393), // Viền của TextField
                ),
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
                  builder: (context) => reset(), // Chuyển đến màn hình đăng ký
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
                  'Gửi',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: const Color.fromARGB(255, 0, 0, 0), // Màu chữ của nút
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