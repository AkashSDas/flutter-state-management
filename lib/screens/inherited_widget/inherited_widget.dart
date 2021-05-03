import 'package:flutter/material.dart';

/// Inherited widget allows you to pass context to any of the
/// descendants widget no matter how far they are in the
/// widget tree.
///
/// Also InheritedWidget is immutable, so we could wrap it in
/// a StatefulWidget to update the state, but here Map is used
/// with StatefulBuilder to update the state.

class InheritedWidgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => InheritedCounter(child: Screen());
}

class InheritedCounter extends InheritedWidget {
  final Map _counter = {'count': 0};
  final Widget child;

  InheritedCounter({this.child}) : super(child: child);

  void increment() {
    _counter['count']++;
    print(_counter['count']);
  }

  get counter => _counter['count'];

  /// updateShouldNotify will run when the inherited widget is rebuilt
  /// and will notify and desendants whether or not they need to rebuilt.
  /// Here it always returns true but you can look at the difference
  /// between old and new data to determine whether or not the widget needs
  /// to re-render.
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  /// Its conventional to implement method `of`
  static InheritedCounter of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCounter>();
  }
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) {
        int counter = InheritedCounter.of(context).counter;
        Function increment = InheritedCounter.of(context).increment;

        return Scaffold(
          appBar: AppBar(title: Text('Inherited Widget')),
          body: Center(child: Text('$counter')),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => setState(() => increment()),
          ),
        );
      },
    );
  }
}
