import 'package:flutter/material.dart';

class LoginFieldModel extends ChangeNotifier {
  String email = '';
  String password = '';

  setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  setPassword(String password) {
    this.password = password;
    notifyListeners();
  }
}
