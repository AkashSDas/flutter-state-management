import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

// stream of numbers with a delay of 3 secs
Stream<int> getNumber({upToNum: 3, waitFor: 3}) async* {
  for (int i = 0; i < upToNum; i++) {
    yield i;
    await Future.delayed(Duration(seconds: waitFor));
  }
}

// counter service
class _Counter {
  // broadcast will make it to listen by multiple wigets
  final StreamController<int> _controller = StreamController<int>.broadcast();
  Stream<int> get outNumber => _controller.stream; // output
  Sink<int> get inNumber => _controller.sink; // input

  void dispose() {
    _controller.close();
  }
}

class RxDartScreen1 extends StatelessWidget {
  final _Counter counterService = _Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rx dart (StreamController)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // using package like getIt will be good in this
            // case to manage dependencies
            Widget1(counterService),
            Widget2(counterService),
          ],
        ),
      ),
    );
  }
}

// widget 1 to show the value of the counter
class Widget1 extends StatelessWidget {
  final _Counter _counterService;
  Widget1(this._counterService);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _counterService.outNumber,
      builder: (context, AsyncSnapshot snapshot) => Text(
        snapshot.hasData ? snapshot.data.toString() : 'No data',
      ),
    );
  }
}

// widget 2 to make changes to value of the counter
class Widget2 extends StatelessWidget {
  final _Counter _counterService;
  Widget2(this._counterService);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: () => _counterService.inNumber.add(Random().nextInt(2000)),
          child: Text('Change value'),
        ),
      ],
    );
  }
}
