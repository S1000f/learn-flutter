import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoFirestore {
  late CollectionReference todoReference;
  late Stream<QuerySnapshot> todoStream;

  initDb() async {
    todoReference = FirebaseFirestore.instance.collection('todos');
    todoStream = todoReference.snapshots();
  }

  List<Todo> getTodos(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data
        !.docs
        .map((doc) => Todo.fromSnapshot(doc))
        .toList();
  }

  Future addTodo(Todo todo) async {
    todoReference.add(todo.toMap());
  }

  Future updateTodo(Todo todo) async {
    todo.reference?.update(todo.toMap());
  }

  Future deleteTodo(Todo todo) async {
    todo.reference?.delete();
  }


}
