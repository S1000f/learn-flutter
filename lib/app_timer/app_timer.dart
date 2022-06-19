import 'package:demo/app_timer/screens/timer_screen.dart';
import 'package:flutter/material.dart';

class AppTimer extends StatelessWidget {
  const AppTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Pomodoro Timer!!',
      home: TimerScreen(),
    );
  }
}
