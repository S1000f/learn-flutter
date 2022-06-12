import '../models/todo.dart';

abstract class TodoProvider {

  Future initDb();

  Future<List<Todo>> getTodos();

  Future<Todo?> getTodo(int id);

  Future addTodo(Todo todo);

  Future deleteTodo(int id);

  Future updateTodo(Todo todo);

}