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
  late final AnimationController _fadeController;

  late final Animation<double> _positionAnimation;
  late final Animation<Color?> _colorAnimation;
  late final Animation<double> _scaleYTweenSequence;
  late final Animation<double> _scaleXTweenSequence;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _positionController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _colorController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _scaleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _fadeController =
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
          weight: 5.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 400, end: 300),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 300, end: 400),
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

    _fadeAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.5, end: 0.25)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.25, end: 0.75),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.75, end: 0.0),
          weight: 50.0,
        ),
      ],
    ).animate(_fadeController);

    _scaleYTweenSequence = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 60),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 70),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 70, end: 20),
          weight: 5,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 20, end: 40),
          weight: 15,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 50),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 60),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 50),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
      ],
    ).animate(_scaleController);

    _scaleXTweenSequence = TweenSequence<double>(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 40),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 30),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 80),
          weight: 5,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 80, end: 60),
          weight: 15,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 50),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 40),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 40),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 70),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 70, end: 50),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
      ],
    ).animate(_scaleController);
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
        body: Stack(children: [
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
                top: _positionAnimation.value - _scaleYTweenSequence.value + 50,
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
          AnimatedBuilder(
            animation: Listenable.merge([_fadeAnimation]),
            builder: (context, child) {
              return Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 100 / 2,
                  top: 450,
                  child: SizedBox(
                    width: 100,
                    height: 2,
                    child: Container(
                      color: Colors.black.withOpacity(_fadeAnimation.value),
                      height: 2,
                      width: 100,
                    ),
                  ));
            },
          ),
          Positioned(
            left:
                MediaQuery.of(context).size.width / 2 - /*(object width = 100)*/
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
