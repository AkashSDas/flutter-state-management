import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class _Counter extends ChangeNotifier {
  int _counter;

  _Counter(this._counter);

  int get currentValue => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

class CounterBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // instance of _Counter
    _Counter counter = Provider.of<_Counter>(context);

    return Column(
      children: [
        RaisedButton(
          onPressed: counter.increment,
          child: Text('increment'),
        ),
        RaisedButton(
          onPressed: counter.decrement,
          child: Text('decrement'),
        ),
      ],
    );
  }
}

class ProviderScreen extends StatelessWidget {
  Widget _buildCounterText(BuildContext context) {
    return Column(
      children: [
        Consumer<_Counter>(
          builder: (context, data, child) => Text(data.currentValue.toString()),
        ),
        SizedBox(height: space),
        CounterBtn(),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('provider package'),
          SizedBox(height: space),
          ChangeNotifierProvider(
            create: (context) => _Counter(0),
            child: Column(
              children: [
                _buildCounterText(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('provider package'),
      ),
      body: _buildBody(context),
    );
  }
}
