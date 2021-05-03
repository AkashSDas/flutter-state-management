import 'package:flutter/material.dart';
import 'package:state_management/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'State Management',
        debugShowCheckedModeBanner: false,
        routes: _routes(context),
      );

  Map<String, Widget Function(BuildContext)> _routes(BuildContext context) => {
        '/': (context) => HomeeScreen(),
      };
}
