import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  Expanded bar(int index, Color color) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          final player = AudioCache();
          player.play('note$index.wav');
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              bar(1, Colors.red),
              bar(2, Colors.orange),
              bar(3, Colors.yellow),
              bar(4, Colors.green),
              bar(5, Colors.blue),
              bar(6, Colors.indigo),
              bar(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
