import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
  double value = 150;
  double _x = 0;
  double _y = 0;
  Color _color = Colors.blue;

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
              TweenAnimationBuilder(
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
              ),
            ]),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;
  double _starSize = 100;
  double _explosionSize = 200;
  double starAnimation = 1.0;
  double startAnimationEnd = 1.0;
  double explosionAnimationEnd = 0.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 350,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            width: selected ? 200.0 : 50.0,
            height: selected ? 50.0 : 200.0,
            top: selected ? 50.0 : 150.0,
            duration: const Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    opacity: startAnimationEnd,
                    duration: Duration(milliseconds: 100),
                    child: TweenAnimationBuilder(
                      tween: Tween(begin: 0.0, end: _starSize),
                      duration: const Duration(milliseconds: 2000),
                      builder: (context, value, child) {
                        return Image.asset(
                          'assets/animations/starRedShade.png',
                          width: value + 300,
                          height: value + 300,
                        );
                      },
                      curve: Curves.bounceIn,
                      onEnd: () {
                        setState(() {
                          startAnimationEnd = 0.0;
                          explosionAnimationEnd = 1.0;

                          // starAnimation = 0.0;
                          // _starSize = 0.0;
                        });
                      },
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: explosionAnimationEnd,
                    duration: Duration(milliseconds: 500),
                    child: TweenAnimationBuilder(
                      tween: Tween(begin: 0.0, end: _explosionSize),
                      duration: const Duration(milliseconds: 2000),
                      builder: (context, value, child) {
                        return Image.asset(
                          'assets/animations/explosion.png',
                          width: value + 200,
                          height: value + 200,
                        );
                      },
                      curve: Curves.bounceIn,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
