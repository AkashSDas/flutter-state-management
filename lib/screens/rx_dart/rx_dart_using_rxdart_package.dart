import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:state_management/main.dart';

/// Here the Counter class is used as a singleton using the
/// get_it package, that's why the counter is available
/// throughout the app

class Counter {
  BehaviorSubject _counter = BehaviorSubject.seeded(0);
  Stream get stream$ => _counter.stream;
  int get current => _counter.value;

  void increment() => _counter.add(current + 1);
}

class RxDartUsingRxDartPackageScreen extends StatelessWidget {
  // to use it anywhere you can use getIt package
  // final Counter _counterService = Counter();

  final counter = getIt.get<Counter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RxDart using RxDart package')),
      body: _CounterWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: counter.increment,
      ),
    );
  }
}

class _CounterWidget extends StatelessWidget {
  final counter = getIt.get<Counter>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: counter.stream$,
      builder: (context, AsyncSnapshot snapshot) => Center(
        child: Text(
          snapshot.hasData ? snapshot.data.toString() : 'No data',
        ),
      ),
    );
  }
}
