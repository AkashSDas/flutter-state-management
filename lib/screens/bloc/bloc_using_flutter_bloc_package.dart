import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment }

class _CounterBloc extends Bloc<CounterEvent, int> {
  /// initial state of _CounterBloc is 0
  _CounterBloc() : super(0);

  /// REDUCER FUNCTION
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}

class BlocUsingFlutterBlocPackageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc using Flutter Bloc package')),
      body: BlocProvider<_CounterBloc>(
        create: (context) => _CounterBloc(),
        child: _CounterText(),
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _CounterBloc _counterBloc = BlocProvider.of<_CounterBloc>(context);

    return BlocBuilder<_CounterBloc, int>(
      builder: (context, state) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$state'),
            SizedBox(height: 30),
            ElevatedButton.icon(
              icon: Icon(Icons.add, size: 20),
              onPressed: () => _counterBloc.add(CounterEvent.increment),
              label: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
