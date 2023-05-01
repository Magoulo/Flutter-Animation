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

    int loopCount = 0;

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              loopCount++;
              if (loopCount < 15) {
                _controller.forward(from: 0.0);
              } else {
                loopCount = 0;
              }
            }
          });
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
        body: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width / 2 - 125 / 2,
              top: 160,
              child: const Text(
                'Flutter Api Animation',
              ),
            ),
            Positioned(
              top: 0,
              left: MediaQuery.of(context).size.width / 2 - 170 / 2,
              child: Lottie.asset(
                'assets/animations/lottieAnimation.json',
                controller: _controller,
                repeat: true,
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width /
                      2 - /*(object width = 100)*/
                  100 / 2,
              bottom: 0 + 50,
              child: SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: const Text('Play'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
