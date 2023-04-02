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
                    child: TweenAnimationBuilder(
                      tween: Tween<Color>(begin: Colors.blue, end: _color),
                      duration: const Duration(seconds: 0),
                      builder: (context, Color color, child) {
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
