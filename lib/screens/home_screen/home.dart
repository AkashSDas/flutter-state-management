import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('State Management')),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              _buildBtn('/', 'Home', context),
              _buildBtn('/set-state', 'Set State', context),
              _buildBtn('/stateful-builder', 'Stateful Builder', context),
              _buildBtn('/inherited-widget', 'Inherited Widget', context),
              _buildBtn('/rx-dart-using-dart', 'Rx Dart using Dart', context),
              _buildBtn(
                '/rx-dart-using-rxdart-package',
                'Rx Dart using RxDart package',
                context,
              ),
              _buildBtn('/bloc-from-scratch', 'Bloc from Scratch', context),
              _buildBtn(
                '/bloc-using-flutter-bloc-package',
                'Bloc using Flutter Bloc package',
                context,
              ),
            ],
          ),
        ),
      );

  /// Build navigation btn
  Widget _buildBtn(String route, String text, BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Center(child: Text(text)),
    );
  }
}
