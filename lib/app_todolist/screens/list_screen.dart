import 'dart:async';

import 'package:demo/app_booklist/screens/list_screen.dart';
import 'package:demo/app_todolist/providers/todo_default.dart';
import 'package:demo/app_todolist/providers/todo_provider.dart';
import 'package:demo/app_todolist/providers/todo_sqlite.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class ListScreen extends StatefulWidget {
  @override
  State createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {
  List<Todo> todoList = [];
  TodoProvider todoProvider = TodoSqliteProvider();
  bool isLoading = true;

  Future initDb() async {
    await todoProvider
        .initDb()
        .then((value) async => {todoList = await todoProvider.getTodos()});
  }

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      initDb().then((value) => {
            setState(() {
              isLoading = false;
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo list app'),
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Icon(Icons.book), Text('News')],
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            '+',
            style: TextStyle(fontSize: 25),
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  String title = '';
                  String description = '';
                  return AlertDialog(
                    title: const Text('add todo'),
                    content: SizedBox(
                      height: 200,
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (value) => title = value,
                            decoration:
                                const InputDecoration(labelText: 'Title'),
                          ),
                          TextField(
                            onChanged: (value) => description = value,
                            decoration:
                                const InputDecoration(labelText: 'Description'),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            await todoProvider.addTodo(
                                Todo(title: title, description: description));
                            List<Todo> find = await todoProvider.getTodos();
                            setState(() {
                              todoList = find;
                            });

                            if (!mounted) return;
                            Navigator.of(context).pop();
                          },
                          child: const Text('Add')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'))
                    ],
                  );
                });
          },
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(todoList[index].title),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              title: const Text('TODO'),
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child:
                                      Text('title: ${todoList[index].title}'),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                      'desc: ${todoList[index].description}'),
                                )
                              ],
                            );
                          });
                    },
                    trailing: SizedBox(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              child: const Icon(Icons.edit),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      String title = todoList[index].title;
                                      String description =
                                          todoList[index].description;

                                      return AlertDialog(
                                        title: const Text('Edit todo'),
                                        content: SizedBox(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              TextField(
                                                onChanged: (value) =>
                                                    title = value,
                                                decoration: InputDecoration(
                                                    hintText:
                                                        todoList[index].title),
                                              ),
                                              TextField(
                                                onChanged: (value) =>
                                                    description = value,
                                                decoration: InputDecoration(
                                                    hintText: todoList[index]
                                                        .description),
                                              )
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                Todo build = Todo(
                                                    id: todoList[index].id,
                                                    title: title,
                                                    description: description);
                                                todoProvider.updateTodo(build);
                                                var todos = await todoProvider
                                                    .getTodos();
                                                setState(() {
                                                  todoList = todos;
                                                });
                                                if (!mounted) return;
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Edit')),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel'))
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            child: InkWell(
                              child: const Icon(Icons.delete),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Delete todo'),
                                        content: const SizedBox(
                                          child: Text(
                                              'Are you sure to delete it?'),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                todoProvider.deleteTodo(
                                                    todoList[index].id ?? 0);
                                                List<Todo> todos =
                                                    await todoProvider
                                                        .getTodos();
                                                setState(() {
                                                  todoList = todos;
                                                });
                                                if (!mounted) return;
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Delete',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Cancel'))
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: todoList.length));
  }
}
