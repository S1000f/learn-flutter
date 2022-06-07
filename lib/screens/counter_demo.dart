import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CounterDemo extends StatefulWidget {
  const CounterDemo({Key? key}) : super(key: key);

  @override
  State createState() {
    return _CounterDemoState();
  }
}

class _CounterDemoState extends State<CounterDemo> {
  int count = 0;

  increase() => setState(() => count += 1);

  decrease() {
    // setState(() => count -= 1);
    count -= 1;
    if (kDebugMode) {
      print('count now: $count');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter demo app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'counting: $count',
              style: const TextStyle(fontSize: 30),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: decrease, child: const Text('- down')),
                OutlinedButton(onPressed: increase, child: const Text('+ up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
