import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int countValue = 0;

  late BehaviorSubject<int> _publishSubject;

  CounterBloc({int initivalCount = 0}) {
    _publishSubject = BehaviorSubject<int>.seeded(initivalCount);
  }

  ValueStream<int> get observable => _publishSubject.stream;

  void increment() {
    countValue++;
    _publishSubject.sink.add(countValue);
  }

  void decrement() {
    countValue--;
    _publishSubject.sink.add(countValue);
  }

  void onDespose() {
    _publishSubject.close();
  }
}
