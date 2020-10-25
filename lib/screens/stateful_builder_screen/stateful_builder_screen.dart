import 'package:flutter/material.dart';

import '../../constant.dart';

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
class StatefulBuilderScreen extends StatelessWidget {
  int _counter = 0;
  final List<int> _list = [0];

  void _incrementCounter(StateSetter setState) {
    setState(() {
      _counter++;

      /// this is a good way(or using a map) of mutating values
      /// inside stateless widget
      _list[0]++;
    });
  }

  void _decrementCounter(StateSetter setState) {
    setState(() {
      _counter--;
      _list[0]--;
    });
  }

  Widget _buildStateBody(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) => Column(
        children: [
          Text('$_counter'),
          Text('${_list[0]}'),
          SizedBox(height: space * 5),
          RaisedButton(
            onPressed: () => _incrementCounter(setState),
            child: Text('increment'),
          ),
          RaisedButton(
            onPressed: () => _decrementCounter(setState),
            child: Text('decrement'),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(space * 2),
      child: Column(
        children: [
          Text('stateful_builder'),
          SizedBox(height: space * 5),
          _buildStateBody(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('set_state'),
      ),
      body: _buildBody(context),
    );
  }
}
