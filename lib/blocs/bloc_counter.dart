import 'package:flutter_bloc_app/blocs/bloc_provider.dart';
import 'dart:async';

class BlocCounter implements BlocBase {
  int counter;
  StreamController<int> counterStreamController = StreamController<int>.broadcast();

  @override
  void dispose() {
    counterStreamController.close();
  }

  BlocCounter() {
    counter = 0;
    counterStreamController.stream.listen(printCounter);
  }

  printCounter(int counter) {
    print("counter = $counter");
  }

  incrementCounter(int value) {
    counter = counter + value;
    counterStreamController.sink.add(counter);
  }
}