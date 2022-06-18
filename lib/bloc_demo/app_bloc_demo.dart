import 'package:demo/bloc_demo/screens/counter_home_screen.dart';
import 'package:demo/bloc_demo/screens/counter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/counter/counter_bloc.dart';

class AppBlocDemo extends StatelessWidget {
  const AppBlocDemo({Key? key}) : super(key: key);

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