import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAnimationScreen extends StatefulWidget {
  const CustomAnimationScreen({super.key});

  @override
  State<CustomAnimationScreen> createState() => _CustomAnimationScreenState();
}

class _CustomAnimationScreenState extends State<CustomAnimationScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const <Widget>[
                Text(
                  'Custom Animation',
                ),
              ],
            ),
            SizedBox(
              width: 200,
              height: 350,
              child: Lottie.asset(
                'assets/animations/72-favourite-app-icon.json',
                controller: _controller,
                repeat: true,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _controller.forward();
                },
                child: const Text('Play'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
