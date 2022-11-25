import 'package:flutter/material.dart';

class PulsaScreen extends StatelessWidget {
  const PulsaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back')),
      ),
    );
  }
}
