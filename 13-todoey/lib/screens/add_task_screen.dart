import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
