import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/apiAnimation.dart';
import 'package:flutter_animation/screens/customAnimation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: const <Widget>[
              Text(
                'Animation Experiment',
              ),
            ],
          ),
          Column(
            children: <Widget>[
              ElevatedButton(
                child: const Text('API'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ApiAnimationScreen()),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Custom'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CustomAnimationScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
