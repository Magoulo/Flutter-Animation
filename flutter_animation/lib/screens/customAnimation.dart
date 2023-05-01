import 'package:flutter/material.dart';

class CustomAnimationScreen extends StatefulWidget {
  const CustomAnimationScreen({super.key});

  @override
  State<CustomAnimationScreen> createState() => _CustomAnimationScreenState();
}

class _CustomAnimationScreenState extends State<CustomAnimationScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<Color?> _colorAnimation;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _positionAnimation;
  late final Animation<double> _scaleYTweenSequence;
  late final Animation<double> _scaleXTweenSequence;

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

    _colorAnimation = TweenSequence<Color?>(
      <TweenSequenceItem<Color?>>[
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: Colors.blue, end: Colors.purple),
          weight: 0.2,
        ),
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: Colors.purple, end: Colors.red),
          weight: 0.2,
        ),
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: Colors.red, end: Colors.yellow),
          weight: 0.2,
        ),
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: Colors.yellow, end: Colors.green),
          weight: 0.2,
        ),
        TweenSequenceItem<Color?>(
          tween: ColorTween(begin: Colors.green, end: Colors.blue),
          weight: 0.2,
        ),
      ],
    ).animate(_controller);
    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 24),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 5),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 5),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 42),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 5),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 20),
    ]).animate(_controller);

    _positionAnimation = TweenSequence<double>(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 400)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 400, end: 400),
          weight: 5.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 400, end: 300),
          weight: 20.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 300, end: 300),
          weight: 5.0,
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
    ).animate(_controller);

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
        //Längst ner, står still för blob
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 70, end: 20),
          weight: 5,
        ),
        //Påväg upp
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 20, end: 40),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 50),
          weight: 15,
        ),
        //50% och 5% till top
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 35),
          weight: 5,
        ),
        //Påväg ner
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 35, end: 60),
          weight: 20,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 30),
          weight: 5,
        ),
        //Når botten
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
      ],
    ).animate(_controller);

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
        //Längst ner, står still för blob
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 80),
          weight: 5,
        ),
        //Påväg upp
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 80, end: 60),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 40),
          weight: 15,
        ),
        //50% och 5% till top
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 40, end: 60),
          weight: 5,
        ),
        //Påväg ner
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 60, end: 45),
          weight: 20,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 45, end: 70),
          weight: 5,
        ),
        //Når botten
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 70, end: 50),
          weight: 10,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 50),
          weight: 10,
        ),
      ],
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 150 / 2,
            top: 160,
            child: const Text(
              'Flutter Custom Animation',
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
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
                      borderRadius: BorderRadius.circular(10)),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                  left: MediaQuery.of(context).size.width /
                          2 - /*(object width = 150)*/
                      150 / 2,
                  top: 450,
                  child: SizedBox(
                    width: 150,
                    height: 2,
                    child: FadeTransition(
                        opacity: _opacityAnimation,
                        child: Container(
                          color: Colors.black,
                          height: 2,
                          width: 150,
                        )),
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
