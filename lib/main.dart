import 'package:demo/app_booklist/screens/detail_screen.dart';
import 'package:demo/app_booklist/screens/list_screen.dart';
import 'package:demo/app_timer/screens/timer_screen.dart';
import 'package:demo/app_todolist/screens/splash_screen.dart';
import 'package:demo/bloc_demo/blocs/counter/counter_bloc.dart';
import 'package:demo/bloc_demo/screens/counter_home_screen.dart';
import 'package:demo/hello_world.dart';
import 'package:demo/screens/counter_demo.dart';
import 'package:demo/screens/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_demo/screens/counter_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyAppBloc());
}

class MyAppBloc extends StatelessWidget {
  const MyAppBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter State Bloc',
        routes: {'/': (context) => const CounterHomeScreen(), '/counter': (context) => const CounterScreen()},
        initialRoute: '/',
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('title!'),
        ),
        body: getButtons());
  }
}

getButtons() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {}, child: const Text('Text Button')),
        const Padding(padding: EdgeInsets.all(20)),
        ElevatedButton(onPressed: () {}, child: const Text('Eleveated Button')),
        const Padding(padding: EdgeInsets.all(20)),
        OutlinedButton(onPressed: () {}, child: const Text('Outlined Button')),
        const Padding(padding: EdgeInsets.all(20)),
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
    padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
    children: [for (var i = 0; i < 50; i++) Text('go buttom overflowed $i')],
  );
}

Center getFontExample(bool isHack) {
  return Center(
    child: Text(
      'Hello Flutter!',
      style: TextStyle(fontSize: 25, fontFamily: isHack ? 'Hack' : 'Ubuntu Mono', fontWeight: FontWeight.w300),
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

Row getRow(MainAxisSize axisSize, MainAxisAlignment axisAlignment, CrossAxisAlignment crossAxisAlignment) {
  return Row(
    mainAxisSize: axisSize,
    mainAxisAlignment: axisAlignment,
    crossAxisAlignment: crossAxisAlignment,
    children: [getContainer(Colors.teal), getContainer(Colors.amber), getContainer(Colors.deepPurple)],
  );
}

Column getColumn() {
  return Column(
    children: [getContainer(Colors.pink), getContainer(Colors.yellow), getContainer(Colors.cyan)],
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
