import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Dicee'),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDie = 1;
  int rightDie = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  if (leftDie < 6) {
                    setState(() {
                      leftDie++;
                    });
                  } else {
                    setState(() {
                      leftDie = 1;
                    });
                  }
                },
                child: Image.asset('images/dice$leftDie.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  if (rightDie < 6) {
                    setState(() {
                      rightDie++;
                    });
                  } else {
                    setState(() {
                      rightDie = 1;
                    });
                  }
                },
                child: Image.asset('images/dice$rightDie.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
