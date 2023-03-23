import 'package:flutter/material.dart';

class ApiAnimationScreen extends StatelessWidget {
  const ApiAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Animation'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Play'),
        ),
      ),
    );
  }
}
