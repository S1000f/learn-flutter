part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {
  const CounterEvent();
}

class CounterIncrement extends CounterEvent {
  const CounterIncrement();

  @override
  toString() => '=-=-=-counter increment';
}

class CounterDecrement extends CounterEvent {
  const CounterDecrement();

  @override
  toString() => '=-=-=-counter decrement';
}