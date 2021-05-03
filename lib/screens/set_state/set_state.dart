import 'package:flutter/material.dart';

class SetState extends StatefulWidget {
  @override
  _SetStateState createState() => _SetStateState();
}

class _SetStateState extends State<SetState> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Set State')),
        body: Center(child: Text('$_counter')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _incrementCounter,
        ),
      );
}
