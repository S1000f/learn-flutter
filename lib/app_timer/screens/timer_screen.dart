import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sprintf/sprintf.dart';

enum TimerStatus {
  running,
  paused,
  stopped,
  resting,
}

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _TimerScreenState();
  }
}

class _TimerScreenState extends State<TimerScreen> {
  static const workSeconds = 25;
  static const restSeconds = 5;

  late TimerStatus _timerStatus;
  late int _timer;
  late int _pomodoroCount;

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 15.0);
  }

  runTimer() async {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      switch (_timerStatus) {
        case TimerStatus.paused:
          t.cancel();
          break;
        case TimerStatus.stopped:
          t.cancel();
          break;
        case TimerStatus.running:
          if (_timer <= 0) {
            showToast('jobs done');
            rest();
          } else {
            setState(() {
              _timer -= 1;
            });
          }
          break;
        case TimerStatus.resting:
          if (_timer <= 0) {
            setState(() {
              _pomodoroCount += 1;
            });
            showToast('today you have got $_pomodoroCount pomodoro');
            t.cancel();
            stop();
          } else {
            setState(() {
              _timer -= 1;
            });
          }
          break;
        default:
          break;
      }
    });
  }

  run() {
    setState(() {
      _timerStatus = TimerStatus.running;
      print("[->] $_timerStatus");
      runTimer();
    });
  }

  rest() {
    setState(() {
      _timer = restSeconds;
      _timerStatus = TimerStatus.resting;
      print("[->] $_timerStatus");
    });
  }

  pause() {
    setState(() {
      _timerStatus = TimerStatus.paused;
      print('[->] $_timerStatus');
    });
  }

  resume() {
    run();
  }

  stop() {
    setState(() {
      _timer = workSeconds;
      _timerStatus = TimerStatus.stopped;
      print('[->] $_timerStatus');
    });
  }

  secondsToString(int seconds) {
    return sprintf("%02d:%02d", [seconds ~/ 60, seconds % 60]);
  }

  @override
  void initState() {
    super.initState();
    _timerStatus = TimerStatus.stopped;
    if (kDebugMode) {
      print(_timerStatus.toString());
    }
    _timer = workSeconds;
    _pomodoroCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> runningButtons = [
      ElevatedButton(
          onPressed: _timerStatus == TimerStatus.paused ? resume : pause,
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          child: Text(
            _timerStatus == TimerStatus.paused ? 'resume' : 'pause',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )),
      const Padding(padding: EdgeInsets.all(20)),
      ElevatedButton(
        onPressed: stop,
        style: ElevatedButton.styleFrom(primary: Colors.grey),
        child: const Text('cancel', style: TextStyle(fontSize: 16)),
      )
    ];

    final List<Widget> stoppedButtons = [
      ElevatedButton(
        onPressed: run,
        style: ElevatedButton.styleFrom(primary: _timerStatus == TimerStatus.resting ? Colors.green : Colors.blue),
        child: const Text('start', style: TextStyle(color: Colors.white, fontSize: 16)),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
        backgroundColor: _timerStatus == TimerStatus.resting ? Colors.green : Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: _timerStatus == TimerStatus.resting ? Colors.green : Colors.blue),
            child: Center(
              child: Text(
                secondsToString(_timer),
                style: const TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _timerStatus == TimerStatus.resting
                ? []
                : (_timerStatus == TimerStatus.stopped ? stoppedButtons : runningButtons),
          )
        ],
      ),
    );
  }
}
