import 'package:flutter/material.dart';

class StatefulBuilderScreen extends StatelessWidget {
  /// here we are breaking the rule of flutter of mutating values
  /// inside stateless widget by incrementing and decrementing
  /// the counter.
  /// SOLUTION: setup your data as map or list because you
  /// can mutate values in that data structrues without breaking
  /// the rules of flutter. (eg. the way _list is used in this)
  /// NOTE: make the list or map as final
  /// That's why we have to use list or map because have to keep it
  /// final which int, String, etc... cannot be used since their final
  /// variables cannot be mutated
  ///
  /// this is a good way(or using a map) of mutating values
  /// inside stateless widget

  // int _counter = 0;
  final List<int> _list = [0];

  @override
  Widget build(BuildContext context) => StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
          appBar: AppBar(title: Text('Stateful Builder')),
          // body: Center(child: Text('$_counter')),
          body: Center(child: Text('${_list[0]}')),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => setState(() => _list[0]++),
          ),
        ),
      );
}
