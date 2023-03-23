import 'package:flutter/material.dart';

class CustomAnimationScreen extends StatelessWidget {
  const CustomAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Animation'),
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
