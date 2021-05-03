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
