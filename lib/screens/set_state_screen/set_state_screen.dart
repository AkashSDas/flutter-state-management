import 'package:flutter/material.dart';

import '../../constant.dart';

class SetStateScreen extends StatefulWidget {
  @override
  _SetStateScreenState createState() => _SetStateScreenState();
}

class _SetStateScreenState extends State<SetStateScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  Widget _buildStateBody() {
    return Column(
      children: [
        Text('$_counter'),
        SizedBox(height: space * 5),
        RaisedButton(
          onPressed: _incrementCounter,
          child: Text('increment'),
        ),
        RaisedButton(
          onPressed: _decrementCounter,
          child: Text('decrement'),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(space * 2),
      child: Column(
        children: [
          Text('set_state'),
          SizedBox(height: space * 5),
          _buildStateBody(),
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
      body: _buildBody(),
    );
  }
}
