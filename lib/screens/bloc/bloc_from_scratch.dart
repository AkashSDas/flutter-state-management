import 'dart:async';

import 'package:flutter/material.dart';

class _Counter {
  int _counter;
  int get counter => _counter;

  _Counter(this._counter);
}

class _CounterBloc {
  final _counterStreamController = StreamController<_Counter>();
  final _incrementStreamController = StreamController<_Counter>();

  void dispose() {
    _counterStreamController.close();
    _incrementStreamController.close();
  }

  Stream get counterStream => _counterStreamController.stream;
  StreamSink get counterSink => _counterStreamController.sink;

  StreamSink get incrementSink => _incrementStreamController.sink;

  void _increment(_Counter counter) {
    counter._counter++;
    _counterStreamController.add(counter);
  }

  _CounterBloc(_Counter counter) {
    _counterStreamController.add(counter);
    _incrementStreamController.stream.listen(_increment);
  }
}

class BlocFromScratchScreen extends StatefulWidget {
  @override
  _BlocFromScratchScreenState createState() => _BlocFromScratchScreenState();
}

class _BlocFromScratchScreenState extends State<BlocFromScratchScreen> {
  static _Counter counter = _Counter(0);
  final _CounterBloc _counterBloc = _CounterBloc(counter);

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Bloc from Scratch')),
        body: StreamBuilder<_Counter>(
          stream: _counterBloc.counterStream,
          builder: (context, snapshot) => Center(
            child: Text(
              snapshot.hasData ? snapshot.data.counter.toString() : 'No data',
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _counterBloc.incrementSink.add(counter),
        ),
      );
}
