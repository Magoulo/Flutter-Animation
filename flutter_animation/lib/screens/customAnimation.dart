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
  late final AnimationController _positionController;
  late final AnimationController _colorController;
  late final AnimationController _scaleController;
  late final Animation<double> _positionAnimation;
  late final Animation<Color?> _colorAnimation;
  late final Animation<double> _scaleYTweenSequence;
  late final Animation<double> _scaleXTweenSequence;

  @override
  void initState() {
    super.initState();

    _positionController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _colorController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _scaleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));

    _positionAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 400)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 400, end: 400)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 10.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 400, end: 200),
          weight: 20.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 200, end: 400),
          weight: 20.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 400, end: 400),
          weight: 25.0,
        ),
      ],
    ).animate(_positionController);

    _colorAnimation = TweenSequence<Color?>(
      <TweenSequenceItem<Color?>>[
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: Colors.red, end: Colors.blue),
          weight: 50.0,
        ),
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: Colors.blue, end: Colors.green),
          weight: 50.0,
        ),
      ],
    ).animate(_colorController);

    _scaleYTweenSequence = TweenSequence<double>(
      [
        // 10%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 60),
          weight: 10,
        ),
        // 20%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 70),
          weight: 10,
        ),
        // 30%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 70, end: 30),
          weight: 10,
        ),
        // 40%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 10,
        ),
        // 50%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
        // 60%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
        // 70%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
        // 80%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 80),
          weight: 10,
        ),
        // 90%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
        // 100%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
      ],
    ).animate(_scaleController);

    _scaleXTweenSequence = TweenSequence<double>(
      [
        // 10%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 40),
          weight: 10,
        ),
        // 20%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 30),
          weight: 10,
        ),
        // 30%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 80),
          weight: 10,
        ),
        // 40%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 80, end: 60),
          weight: 10,
        ),
        // 50%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 40),
          weight: 10,
        ),
        // 60%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 50),
          weight: 10,
        ),
        // 70%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
        // 80%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 80),
          weight: 10,
        ),
        // 90%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
        // 100%
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
      ],
    ).animate(_scaleController);

    // _controller.forward();
  }

  @override
  void dispose() {
    _positionController.dispose();
    _colorController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _positionController.reset();
    _colorController.reset();
    _scaleController.reset();

    _positionController.forward();
    _colorController.forward();
    _scaleController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*const Align(
                alignment: FractionalOffset.topCenter,
                child: Text(
                  'Api Animation',
                ),
              ),*/
              AnimatedBuilder(
                animation: Listenable.merge(
                    [_positionController, _colorController, _scaleController]),
                builder: (context, child) {
                  return Positioned(
                    top: _positionAnimation.value,
                    left: MediaQuery.of(context).size.width / 2 -
                        _scaleXTweenSequence.value / 2,
                    child: Container(
                      width: _scaleXTweenSequence.value,
                      height: _scaleYTweenSequence.value,
                      decoration: BoxDecoration(
                          color: _colorAnimation.value,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  );
                },
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
                    onPressed: _startAnimation,
                    child: const Text('Play'),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}


/*Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(8)),
                        ); */
