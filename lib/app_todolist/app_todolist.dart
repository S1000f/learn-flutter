import 'package:demo/app_todolist/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppTodoList extends StatelessWidget {
  const AppTodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo-List',
      home: SplashScreen(),
    );
  }
}