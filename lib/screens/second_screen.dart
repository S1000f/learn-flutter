import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String screenData;

  const SecondScreen(this.screenData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('this is data from first one: $screenData'),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Go to the first one'))
          ],
        ),
      ),
    );
  }
}
