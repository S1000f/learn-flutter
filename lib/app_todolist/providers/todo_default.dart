import 'package:demo/app_todolist/providers/todo_provider.dart';

import '../models/todo.dart';

class TodoDefault {
  List<Todo> dummyTodos = [
    Todo(
        id: 1,
        title: 'learning Flutter',
        description: 'learning Flutter framework to build mobile applications'),
    Todo(id: 2, title: 'youtube', description: 'enjoy watching Youtube videos'),
    Todo(id: 3, title: 'sleep', description: 'good sleep is the best medicine')
  ];

  List<Todo> getTodos() {
    return dummyTodos;
  }

  Todo getTodo(int id) {
    return dummyTodos[id];
  }

  Todo addTodo(Todo todo) {
    Todo build = Todo(
        id: dummyTodos.length + 1,
        title: todo.title,
        description: todo.description);
    dummyTodos.add(build);

    return build;
  }

  deleteTodo(int id) {
    dummyTodos.removeWhere((element) => element.id == id);
  }

  updateTodo(Todo todo) {
    var index = dummyTodos.indexWhere((element) => element.id == todo.id);
    dummyTodos[index] = todo;
  }
}
