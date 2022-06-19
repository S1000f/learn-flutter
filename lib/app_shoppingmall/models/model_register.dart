import 'package:flutter/material.dart';

class RegisterFieldModel extends ChangeNotifier {
  String email = '';
  String password = '';
  String passwordConfirm = '';

  setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  setPasswordConfirm(String passwordConfirm) {
    this.passwordConfirm = passwordConfirm;
    notifyListeners();
  }
}
