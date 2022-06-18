import 'package:demo/app_booklist/screens/list_screen.dart';
import 'package:demo/app_timer/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class AppBookList extends StatelessWidget {
  const AppBookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Book List',
      home: ListScreen(),
    );
  }
}
