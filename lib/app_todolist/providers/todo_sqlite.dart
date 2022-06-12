import 'package:demo/app_todolist/providers/todo_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/todo.dart';

class TodoSqliteProvider implements TodoProvider {
  late Database db;

  @override
  initDb() async {
    db = await openDatabase('my_db.db');
    await db.execute(
        'create table if not exists MyTodo (id integer primary key autoincrement not null, title text, description text)');
  }

  @override
  Future<List<Todo>> getTodos() async {
    List<Todo> todos = [];
    List<Map> maps =
        await db.query('MyTodo', columns: ['id', 'title', 'description']);
    for (var element in maps) {
      todos.add(Todo.fromMap(element));
    }

    return todos;
  }

  @override
  Future<Todo?> getTodo(int id) async {
    List<Map> map = await db.query('MyTodo',
        columns: ['id', 'title', 'description'],
        where: 'id = ?',
        whereArgs: [id]);

    if (map.isNotEmpty) {
      return Todo.fromMap(map[0]);
    }
    return null;
  }

  @override
  Future addTodo(Todo todo) async {
    int id = await db.insert('MyTodo', todo.toMap());
  }

  @override
  Future deleteTodo(int id) async {
    await db.delete('MyTodo', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future updateTodo(Todo todo) async {
    await db
        .update('MyTodo', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }

}
