import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAnimationScreen extends StatefulWidget {
  const CustomAnimationScreen({super.key});

  @override
  State<CustomAnimationScreen> createState() => _CustomAnimationScreenState();
}

class _CustomAnimationScreenState extends State<CustomAnimationScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late final TweenSequence<double> positionTweenSequence;
  late final TweenSequence<double> scaleYTweenSequence;
  late final TweenSequence<double> scaleXTweenSequence;
  final screenHeight = 300.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    positionTweenSequence = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 50),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 100),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 100, end: 150),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 150, end: 200),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: screenHeight, end: screenHeight - 100),
          weight: 0.1,
        ),
        TweenSequenceItem<double>(
          tween:
              Tween<double>(begin: screenHeight + 20, end: screenHeight + 50),
          weight: 0.1,
        ),
      ],
    );
    scaleYTweenSequence = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 1.1),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.1, end: 1.3),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.3, end: 1.1),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.1, end: 1),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 2),
          weight: 0.1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.8, end: 1),
          weight: 0.1,
        ),
      ],
    );

    scaleXTweenSequence = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 0.9),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.9, end: 0.7),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.7, end: 0.9),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.9, end: 1),
          weight: 0.2,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1, end: 2),
          weight: 0.1,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.8, end: 1),
          weight: 0.1,
        ),
      ],
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            final positionValue =
                positionTweenSequence.animate(controller).value;
            final scaleYValue = scaleYTweenSequence.animate(controller).value;
            final scaleXValue = scaleXTweenSequence.animate(controller).value;
            return Transform.scale(
              scaleY: scaleYValue,
              scaleX: scaleXValue,
              child: Transform.translate(
                offset: Offset(0, positionValue),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


 /* TweenAnimationBuilder(
                tween:
                    Tween<Offset>(begin: Offset(150, 0), end: Offset(150, _y)),
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                builder: (context, Offset offset, child) {
                  return Positioned(
                    left: offset.dx,
                    top: offset.dy,
                    child: TweenAnimationBuilder<Color?>(
                      tween: ColorTween(begin: Colors.blue, end: _color),
                      duration: const Duration(seconds: 1),
                      builder: (_, Color? color, __) {
                        return Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(8)),
                        );
                      },
                      child: child,
                    ),
                  );
                },
                child: Container(),
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
                      setState(() {
                        // _x = _x == 0 ? 100 : 0;
                        _y = _y == 0 ? 400 : 0;
                        _color =
                            _color == Colors.blue ? Colors.red : Colors.blue;
                      });
                    },
                    child: const Text('Play'),
                  ),
                ),
              ),*/