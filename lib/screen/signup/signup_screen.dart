import 'package:flutter/material.dart';
import 'package:hd_shoesshop/screen/signup/widget_signup/signup_form.dart';
import 'package:hd_shoesshop/screen/signup/widget_signup/signup_header.dart';
import 'package:hd_shoesshop/screen/signup/widget_signup/social_signup.dart';
 // Import widget SocialLogin

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Màu nền của màn hình
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SignupHeader(),
            SignupFormWidget(),
            SocialLoginWidget(),
          ],
        ),
      ),
    );
  }
}
