import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/model_item.dart';

class ItemProvider with ChangeNotifier {
  CollectionReference itemReference;
  List<Item> items = [];

  ItemProvider({reference}) : itemReference = reference ?? FirebaseFirestore.instance.collection('items');

  fetchItems() async {
    items = await itemReference
        .get()
        .then((QuerySnapshot rs) => rs.docs.map((DocumentSnapshot snapshot) => Item.fromSnapshot(snapshot)).toList());
    notifyListeners();
  }
}
