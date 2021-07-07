import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  Expanded bar(int index, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: () {
            final player = AudioCache();
            player.play('note$index.wav');
          },
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PhysicalModel(
                color: Colors.grey,
                elevation: 10.0,
                shape: BoxShape.circle,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                ),
              ),
              SizedBox(),
              PhysicalModel(
                color: Colors.grey,
                elevation: 10.0,
                shape: BoxShape.circle,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
