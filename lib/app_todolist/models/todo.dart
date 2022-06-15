import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  int? id;
  late String title;
  late String description;
  late DocumentReference? reference;

  Todo(
      {this.id,
      required this.title,
      required this.description,
      this.reference});

  toMap() {
    return {'id': id, 'title': title, 'description': description};
  }

  Todo.fromMap(Map<dynamic, dynamic>? map) {
    id = map?['id'];
    title = map?['title'];
    description = map?['description'];
  }

  Todo.fromSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    id = data['id'];
    title = data['title'];
    description = data['description'];
    reference = documentSnapshot.reference;
  }
}
