import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
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
  int ballState = 0;
  int responseText = 0;

  var responses = [
    const Tuple2<String, double>('', 16.0),
    const Tuple2<String, double>('IT IS\nUNCLEAR', 16.0),
    const Tuple2<String, double>('IT IS DECIDEDLY\nSO', 14.0),
    const Tuple2<String, double>('WHEN PIGS FLY', 16.0),
    const Tuple2<String, double>('YOU MAY\nRELY ON\nIT',16.0),
    const Tuple2<String, double>('MY SOURCES SAY NO',16.0),
    const Tuple2<String, double>('AS I SEE\nIT, YES',16.0),
    const Tuple2<String, double>('OUTLOOK GOOD',16.0),
    const Tuple2<String, double>('REPLY HAZY TRY AGAIN',14.0),
    const Tuple2<String, double>('PROBABLY NOT',15.0),
    const Tuple2<String, double>('SIGNS POINT TO YES',16.0),
    const Tuple2<String, double>('ASK AGAIN LATER',16.0),
    const Tuple2<String, double>('BETTER NOT TELL YOU\nNOW',14.0),
    const Tuple2<String, double>('MOST\nLIKELY',18.0),
    const Tuple2<String, double>('CONCENTRATE AND ASK AGAIN',11.0),
    const Tuple2<String, double>('WITHOUT A DOUBT', 16.0),
    const Tuple2<String, double>('DON\'T COUNT\nON IT',16.0),
    const Tuple2<String, double>('MY REPLY\n IS NO',16.0),
    const Tuple2<String, double>('CANNOT PREDICT\nNOW',16.0),
    const Tuple2<String, double>('OUTLOOK NOT SO GOOD',16.0),
    const Tuple2<String, double>('VERY DOUBTFUL',15.0),
  ];

  Text buildText(Tuple2<String, double> response) {
    return Text(
      response.item1,
      style: TextStyle(
        color: Colors.lightBlueAccent,
        fontWeight: FontWeight.bold,
        fontSize: response.item2,
      ),
      textAlign: TextAlign.center,
    );
  }

  void randomize() {
    setState(() {
      switch (ballState) {
        case 0:
          {
            ballState = 1;
            responseText = Random().nextInt(20)+1;
          }
          break;
        case 1:
          {
            ballState = 0;
            responseText = 0;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: TextButton(
        onPressed: randomize,
        child: Stack(
          children: [
            Center(child: Image.asset('images/ball$ballState.png')),
            Align(
              alignment: Alignment(0.02, -0.03),
              child: Container(
                child: buildText(responses[responseText]),
                width: 85.0,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
