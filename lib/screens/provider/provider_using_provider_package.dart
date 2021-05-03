import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _Counter extends ChangeNotifier {
  int _counter;

  _Counter(this._counter);

  int get currentValue => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}

class ProviderUsingProviderPackage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider using Provider package')),
      body: ChangeNotifierProvider(
        create: (context) => _Counter(0),
        child: _CounterText(),
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _Counter counter = Provider.of<_Counter>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<_Counter>(
            builder: (context, data, child) => Center(
              child: Text('${data.currentValue}'),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton.icon(
            icon: Icon(Icons.add, size: 20),
            onPressed: counter.increment,
            label: Text('Increment'),
          ),
        ],
      ),
    );
  }
}
