import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello world!')),
      body: const Text('Hello, world!', style: TextStyle(fontSize: 40),),
    );
  }
}

class GoodbyeWorld extends StatelessWidget {
  const GoodbyeWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}

