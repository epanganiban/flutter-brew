import 'package:flutter/material.dart';

import 'package:todoey/widgets/task_checkbox.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
      ),
      trailing: TaskCheckbox(),
    );
  }
}