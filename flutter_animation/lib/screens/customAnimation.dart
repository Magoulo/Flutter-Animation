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
<<<<<<< Updated upstream
  Color _color = Colors.blue;
=======
  Color _color = Colors.purple;
>>>>>>> Stashed changes

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
<<<<<<< Updated upstream
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
=======
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




/*
class CustomAnimationScreen extends StatefulWidget {
  const CustomAnimationScreen({super.key});

  @override
  State<CustomAnimationScreen> createState() => _CustomAnimationScreenState();
}

class _CustomAnimationScreenState extends State<CustomAnimationScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  double _starSize = 100;
  double _explosionSize = 200;
  double starAnimation = 1.0;
  double starAnimationEnd = 1.0;
  double explosionAnimationEnd = 0.0;
  bool selected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // bouncing box
  @override
  Widget build(BuildContext context) {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

// Create a Tween object that will interpolate the values of the animation
    final Tween<double> _tween =
        Tween<double>(begin: 0, end: MediaQuery.of(context).size.height - 50);

    // Chain the Tween object with a CurvedAnimation object to specify the animation curve
    final CurvedAnimation _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceOut);

    // Attach the Tween object to the CurvedAnimation object to create the final Animation object
    _animation = _tween.animate(_curvedAnimation);

    // Start the animation
    _controller.forward();

    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(top: _animation.value),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ),
      ),
    );
  }
}
*/








/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: <Widget>[
                //  MyStatefulWidget(),

                // const Text(
                //   'Custom Animation',
                //  ),

                // Tween 1
                AnimatedOpacity(
                  opacity: starAnimation,
                  duration: Duration(milliseconds: 100),
                  child: TweenAnimationBuilder(
                    tween: Tween(
                        begin: 0.0,
                        end: MediaQuery.of(context).size.height - 50),
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
                        starAnimationEnd = 1.0;
                        starAnimation = 0.0;
                        // _starSize = 0.0;
                      });
                    },
                  ),
                ),

                /*   AnimatedOpacity(
                  opacity: starAnimationEnd,
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
                ),*/

                // Tween 2
                /*    TweenAnimationBuilder(
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
                      _starSize = 0.0;
                    });
                  },
                ),*/
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _controller.forward();
>>>>>>> Stashed changes
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
*/