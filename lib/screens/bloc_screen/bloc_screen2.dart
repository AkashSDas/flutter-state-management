import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';

enum CounterEvent { increment, decrement }

class _CounterBloc extends Bloc<CounterEvent, int> {
  // initial state of _CounterBloc is 0
  _CounterBloc() : super(0);

  // REDUCER FUNCTION

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}

class _CounterBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _CounterBloc _counterBloc = BlocProvider.of<_CounterBloc>(context);

    return Column(
      children: [
        BlocBuilder<_CounterBloc, int>(
          cubit: _counterBloc,
          builder: (context, state) => Text('$state'),
        ),
        RaisedButton(
          onPressed: () => _counterBloc.add(CounterEvent.increment),
          child: Text('increment'),
        ),
        RaisedButton(
          onPressed: () => _counterBloc.add(CounterEvent.decrement),
          child: Text('decrement'),
        ),
      ],
    );
  }
}

class BlocScreen2 extends StatelessWidget {
  Widget _buildStateBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('bloc and flutter_bloc package'),
          SizedBox(height: space),
          _CounterBtn(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bloc and flutter_bloc package'),
      ),
      body: BlocProvider<_CounterBloc>(
        create: (context) => _CounterBloc(),
        child: _buildStateBody(context),
      ),
    );
  }
}
