import 'package:flutter/material.dart';

class SearchQuery with ChangeNotifier {
  String text = '';

  updateText(String txt) {
    text = txt;
    notifyListeners();
  }
}