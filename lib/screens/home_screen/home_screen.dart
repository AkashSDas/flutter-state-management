import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildBtn(String routeName, String textOnBtn, BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Center(
        child: Text(textOnBtn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            _buildBtn('/set_state', 'set_state', context),
            _buildBtn('/stateful_builder', 'stateful_builder', context),
            _buildBtn('/rx_dart1', 'rx_dart (StreamController)', context),
            _buildBtn('/rx_dart2', 'rx_dart (rx_dart package)', context),
            _buildBtn('/provider', 'provider package', context),
            _buildBtn('/bloc1', 'bloc', context),
            _buildBtn('/bloc2', 'bloc and flutter_bloc package', context),
          ],
        ),
      ),
    );
  }
}
