import 'package:demo/app_booklist/screens/detail_screen.dart';
import 'package:demo/app_booklist/screens/list_screen.dart';
import 'package:demo/app_timer/screens/timer_screen.dart';
import 'package:demo/hello_world.dart';
import 'package:demo/screens/counter_demo.dart';
import 'package:demo/screens/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TimerScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('title!'),
        ),
        body: getButtons());
  }
}

getButtons() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {}, child: Text('Text Button')),
        Padding(padding: EdgeInsets.all(20)),
        ElevatedButton(onPressed: () {}, child: Text('Eleveated Button')),
        Padding(padding: EdgeInsets.all(20)),
        OutlinedButton(onPressed: () {}, child: Text('Outlined Button')),
        Padding(padding: EdgeInsets.all(20)),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star),
        )
      ],
    ),
  );
}

getOverflowed() {
  return ListView(
    children: [for (var i = 0; i < 50; i++) Text('go buttom overflowed $i')],
    padding: EdgeInsets.fromLTRB(40, 60, 40, 40),
  );
}

Center getFontExample(bool isHack) {
  return Center(
    child: Text(
      'Hello Flutter!',
      style: TextStyle(
          fontSize: 25,
          fontFamily: isHack ? 'Hack' : 'Ubuntu Mono',
          fontWeight: FontWeight.w300),
    ),
  );
}

Center getImageCenter(bool isLocal) {
  return Center(
    child: isLocal
        ? Image.asset(
            'images/mimoji.png',
            width: 500,
            height: 250,
          )
        : Image.network('https://avatars.githubusercontent.com/u/59071967?v=4'),
  );
}

ListView getListView() {
  return ListView(
    scrollDirection: Axis.vertical,
    children: [
      ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          trailing: const Icon(Icons.navigate_next),
          onTap: () {}),
      ListTile(
          leading: const Icon(Icons.event),
          title: const Text('events'),
          trailing: const Icon(Icons.navigate_next),
          onTap: () {}),
      ListTile(
          leading: const Icon(Icons.add_call),
          title: const Text('add call'),
          trailing: const Icon(Icons.navigate_next),
          onTap: () {}),
      getContainer(Colors.lightBlue)
    ],
  );
}

SingleChildScrollView getSingleChildScrollView() {
  final items = List.generate(100, (index) => index.toString());

  return SingleChildScrollView(
    child: ListBody(
      children: items.map((e) => Text(e)).toList(),
    ),
  );
}

Stack getStack() {
  return Stack(
    children: [
      getContainer(Colors.indigo),
      getContainer(Colors.deepOrange, width: 80, height: 80),
      getContainer(Colors.green, width: 40, height: 40)
    ],
  );
}

Row getRow(MainAxisSize axisSize, MainAxisAlignment axisAlignment,
    CrossAxisAlignment crossAxisAlignment) {
  return Row(
    mainAxisSize: axisSize,
    mainAxisAlignment: axisAlignment,
    crossAxisAlignment: crossAxisAlignment,
    children: [
      getContainer(Colors.teal),
      getContainer(Colors.amber),
      getContainer(Colors.deepPurple)
    ],
  );
}

Column getColumn() {
  return Column(
    children: [
      getContainer(Colors.pink),
      getContainer(Colors.yellow),
      getContainer(Colors.cyan)
    ],
  );
}

Container getContainer(Color color, {double width = 100, double height = 100}) {
  return Container(
    color: color,
    width: width,
    height: height,
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.all(8.0),
  );
}
