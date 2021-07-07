import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Ask Me Anything'),
      ),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int ballIndex = 0;

  void randomize() {
    setState(() {
      if (ballIndex == 0) {
        ballIndex = Random().nextInt(5) + 1;
      } else {
        ballIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: TextButton(
        onPressed: randomize,
        child: Image.asset('images/ball$ballIndex.png'),
      ),
    ));
  }
}
