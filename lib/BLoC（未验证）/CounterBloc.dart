// counter_bloc.dart
import 'package:bloc/bloc.dart';

import 'CounterEvent.dart';
import 'CounterState.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<IncrementCounter>((event, emit) {
      emit(CounterState(counter: state.counter + 1));
    });
  }
}
