import 'package:flutter/material.dart';
import 'widgets_login/login_form.dart';
import 'widgets_login/login_header.dart';
import 'widgets_login/social_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LoginForm(),
                    SocialLogin(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
