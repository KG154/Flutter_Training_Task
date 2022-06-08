import 'package:bloc/bloc.dart';

enum CounterEvent {
  Increment,
  Decrement,
  Reset,
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  void reset() => emit(state * 0 + 0);
}
