import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  late String title;
  late String description;
  late String brand;
  late int price;
  late String registerDate;
  late String id;

  Item(this.title, this.description, this.brand, this.price, this.registerDate, this.id);

  Item.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    title = data['title'];
    description = data['description'];
    brand = data['brand'];
    price = data['price'];
    registerDate = data['registerDate'];
  }
}
