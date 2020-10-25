import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../constant.dart';

class _Counter {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);
  Stream get stream$ => _counter.stream;
  int get current => _counter.value;

  void increment() {
    _counter.add(current + 1);
  }

  void decrement() {
    _counter.add(current - 1);
  }
}

class RxDartScreen2 extends StatelessWidget {
  // to use it anywhere you can use getIt package
  final _Counter _counterService = _Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rx dart (rx_dart package)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('rx_dart package'),
            SizedBox(height: space),
            StreamBuilder(
              stream: _counterService.stream$,
              builder: (context, AsyncSnapshot snapshot) => Text(
                snapshot.hasData ? snapshot.data.toString() : 'No data',
              ),
            ),
            RaisedButton(
              onPressed: () => _counterService.increment(),
              child: Text('increment'),
            ),
            RaisedButton(
              onPressed: () => _counterService.decrement(),
              child: Text('decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
