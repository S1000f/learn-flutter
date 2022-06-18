import 'package:flutter/material.dart';

import 'item.dart';

class Cart extends ChangeNotifier {
  final List<Item> items = [];

  int getTotalPrice() => items.isNotEmpty ? items.map((e) => e.price).reduce((e1, e2) => e1 + e2).toInt() : 0;

  addItem(Item item) {
    items.add(item);
    notifyListeners();
  }

  deleteItem(int id) {
    items.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
