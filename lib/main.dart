import 'package:flutter/material.dart';

import './screens/screens.dart';
import 'screens/bloc_screen/bloc_screen2.dart';
import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management',
      debugShowCheckedModeBanner: false,

      // Routes
      routes: {
        '/': (context) => HomeScreen(),
        '/set_state': (context) => SetStateScreen(),
        '/stateful_builder': (context) => StatefulBuilderScreen(),
        '/rx_dart1': (context) => RxDartScreen1(),
        '/rx_dart2': (context) => RxDartScreen2(),
        '/provider': (context) => ProviderScreen(),
        '/bloc1': (context) => BlocScreen1(),
        '/bloc2': (context) => BlocScreen2(),
      },

      // Theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
