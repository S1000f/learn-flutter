import 'package:demo/bloc_demo/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter screen'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter : ${state.count}'),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(const CounterIncrement());
                  },
                  child: const Text('Increment')),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(const CounterDecrement());
                  },
                  child: const Text('Decrement'))
            ],
          ),
        ),
      ),
    );
  }
}
