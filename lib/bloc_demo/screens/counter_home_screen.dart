import 'package:demo/bloc_demo/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterHomeScreen extends StatelessWidget {
  const CounterHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        buildWhen: (before, current) => before.count != current.count,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('count : ${state.count}'),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/counter');
                    },
                    child: const Text('Go to CounterScreen'))
              ],
            ),
          );
        },
      ),
    );
  }
}
