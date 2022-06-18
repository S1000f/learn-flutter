import '../models/item.dart';

class ItemList {
  final List<Item> items = [
    Item(1, 'no 1', 1000),
    Item(2, 'no 2', 1500),
    Item(3, 'no 3', 2000),
    Item(4, 'no 4', 3000),
    Item(5, 'no 5', 2200),
    Item(7, 'no 7', 300),
    Item(8, 'no 8', 4500),
  ];

  List<Item> getItems() => items;
}
