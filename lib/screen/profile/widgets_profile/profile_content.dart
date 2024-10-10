import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hd_shoesshop/model/UserInfoProvider.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfoProvider>(context);
    final User? currentUser = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 3,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/profile.png'),
                    ),
                  ),
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // Thêm logic để thay đổi ảnh đại diện
                  },
                  child: Text(
                    'Thay đổi ảnh đại diện',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 20),
          Text(
            'Thông tin người dùng',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color(0xFF000000),
            ),
          ),
          SizedBox(height: 18),

          _buildInfoRow('Họ tên', '${userInfo.lname} ${userInfo.fname}', true),
          _buildInfoRow('Tên tài khoản', userInfo.username, true),
          _buildEmailRow(currentUser),
          _buildInfoRow('Số điện thoại', userInfo.phoneNumber, false),

          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 1),
          
          SizedBox(height: 20),
           Container(
            margin: EdgeInsets.fromLTRB(3, 0, 0, 271), // Tùy chỉnh margin như mong muốn
            child: Align(
              alignment: Alignment.topCenter, // Căn chỉnh nút đăng xuất ở trên cùng trung tâm
              child: TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut(); // Đăng xuất khỏi Firebase
                  Navigator.of(context).pushReplacementNamed('/login'); // Điều hướng đến trang đăng nhập
                },
                child: Text(
                  'Đăng xuất',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Color(0xFFD32F2F), // Màu chữ đỏ
                  ),
                ),
              ),
            ),
           ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool showArrow) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF939393),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Color(0xE0232323),
              ),
              textAlign: TextAlign.right,
            ),
          ),
          if (showArrow) SizedBox(width: 5),
          if (showArrow)
            Icon(
              Icons.arrow_forward,
              size: 18,
              color: Colors.black,
            ),
        ],
      ),
    );
  }

  Widget _buildEmailRow(User? currentUser) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9.0, horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Email',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF939393),
            ),
          ),
          Expanded(
            child: Text(
              currentUser?.email ?? 'Không có email',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Color(0xE0232323),
              ),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(width: 5),
          Icon(
            currentUser?.emailVerified ?? false
                ? Icons.verified
                : Icons.warning,
            color: currentUser?.emailVerified ?? false
                ? Colors.green
                : Colors.orange,
            size: 18,
          ),
        ],
      ),
    );
  }
}