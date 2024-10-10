import 'package:flutter/material.dart';
import 'package:hd_shoesshop/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Thực hiện điều hướng sau 3.7 giây
    Future.delayed(Duration(seconds: 3, milliseconds: 700), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OnboardingScreen()), // Thay NextScreen bằng widget mục tiêu của bạn
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 131),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Container(
                        width: 393,
                        height: 47,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(39, 0, 38, 136),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/logo/Logo1.png',
                          ),
                        ),
                      ),
                      child: Container(
                        width: 316,
                        height: 316,
                      ),
                    ),
                  ),
                  // Đặt chữ và GIF vào cùng một group
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Đang tải...',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5), // Khoảng cách giữa chữ và GIF
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  'assets/gif/loadingbarline.gif',
                                ),
                              ),
                            ),
                            child: Container(
                              width: 201,
                              height: 21,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
