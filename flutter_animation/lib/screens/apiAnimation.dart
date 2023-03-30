import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ApiAnimationScreen extends StatefulWidget {
  const ApiAnimationScreen({super.key});

  @override
  State<ApiAnimationScreen> createState() => _ApiAnimationScreenState();
}

class _ApiAnimationScreenState extends State<ApiAnimationScreen>
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
                  'Api Animation',
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
