import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:state_management/screens/rx_dart/rx_dart_using_rxdart_package.dart';
import 'package:state_management/screens/screens.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<Counter>(Counter());

  // Alternatively you could write it if you don't like global variables
  // GetIt.I.registerSingleton<Counter>(Counter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'State Management',
        debugShowCheckedModeBanner: false,
        routes: _routes(context),
        theme: ThemeData(
          textTheme: TextTheme(bodyText2: TextStyle(fontSize: 60)),
        ),
      );

  Map<String, Widget Function(BuildContext)> _routes(BuildContext context) => {
        '/': (context) => HomeScreen(),
        '/set-state': (context) => SetStateScreen(),
        '/stateful-builder': (context) => StatefulBuilderScreen(),
        '/inherited-widget': (context) => InheritedWidgetScreen(),
        '/rx-dart-using-dart': (context) => RxDartUsingDartScreen(),
        '/rx-dart-using-rxdart-package': (context) =>
            RxDartUsingRxDartPackageScreen(),
      };
}
