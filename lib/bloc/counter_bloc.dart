import 'dart:async';

import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement, reset }

class CounterBloc extends Bloc<CounterEvent, int> {
  int counter = 0;
  final _stateController = StreamController<int>();
  final _eventController = StreamController<CounterEvent>();

  StreamSink<int> get _counterSink => _stateController.sink;
  Stream<int> get counterStream => _stateController.stream;

  StreamSink<CounterEvent> get eventSink => _eventController.sink;
  Stream<CounterEvent> get _eventStream => _eventController.stream;

  CounterBloc() : super(0) {
    _eventStream.listen((event) {
      if (event == CounterEvent.increment) {
        counter++;
      } else if (event == CounterEvent.decrement) {
        counter--;
      } else if (event == CounterEvent.reset) {
        counter = 0;
      }
      _counterSink.add(counter);
    });
  }
  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
