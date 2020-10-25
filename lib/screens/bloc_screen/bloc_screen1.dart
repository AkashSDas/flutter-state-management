import 'dart:async';

import 'package:flutter/material.dart';

import '../../constant.dart';

class BlocScreen1 extends StatefulWidget {
  @override
  _BlocScreen1State createState() => _BlocScreen1State();
}

class _Counter {
  int _counter;
  int get counter => _counter;

  _Counter(this._counter);
}

class _CounterBloc {
  final _counterStreamController = StreamController<_Counter>();
  final _incrementStreamController = StreamController<_Counter>();
  final _decrementStreamController = StreamController<_Counter>();

  void dispose() {
    _counterStreamController.close();
    _incrementStreamController.close();
    _decrementStreamController.close();
  }

  Stream get counterStream => _counterStreamController.stream;
  StreamSink get counterSink => _counterStreamController.sink;

  StreamSink get incrementSink => _incrementStreamController.sink;
  StreamSink get decrementSink => _decrementStreamController.sink;

  void _increment(_Counter counter) {
    counter._counter++;
    _counterStreamController.add(counter);
  }

  void _decrement(_Counter counter) {
    counter._counter--;
    _counterStreamController.add(counter);
  }

  _CounterBloc(_Counter counter) {
    _counterStreamController.add(counter);
    _incrementStreamController.stream.listen(_increment);
    _decrementStreamController.stream.listen(_decrement);
  }
}

class _BlocScreen1State extends State<BlocScreen1> {
  static _Counter counter = _Counter(0);
  final _CounterBloc _counterBloc = _CounterBloc(counter);

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  Widget _buildStateBody() {
    return Column(
      children: [
        StreamBuilder<_Counter>(
          stream: _counterBloc.counterStream,
          builder: (context, snapshot) => Text(
            snapshot.hasData ? snapshot.data.counter.toString() : 'No data',
          ),
        ),
        RaisedButton(
          onPressed: () {
            _counterBloc.incrementSink.add(counter);
          },
          child: Text('increment'),
        ),
        RaisedButton(
          onPressed: () {
            _counterBloc.decrementSink.add(counter);
          },
          child: Text('decrement'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('bloc'),
            SizedBox(height: space),
            _buildStateBody(),
          ],
        ),
      ),
    );
  }
}
