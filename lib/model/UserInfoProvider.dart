import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  String _firstname = "";
  String _lastname = "";
  String _phoneNumber = "";
  String _username = "";
  

  String get fname => _firstname;
  String get lname => _lastname;
  String get phoneNumber => _phoneNumber;
  String get username => _username;

  void updateUserInfo(String fname, String lname, String phoneNumber, String username) {
    _firstname = fname;
    _lastname = lname;
    _phoneNumber = phoneNumber;
    _username = username;
    notifyListeners();
  }
}
