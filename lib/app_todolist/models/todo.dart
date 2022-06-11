class Todo {
  int? id;
  late String title;
  late String description;

  Todo({this.id, required this.title, required this.description});

  toMap() {
    return {'id': id, 'title': title, 'description': description};
  }

  Todo.fromMap(Map<dynamic, dynamic>? map) {
    id = map?['id'];
    title = map?['title'];
    description = map?['description'];
  }
}
