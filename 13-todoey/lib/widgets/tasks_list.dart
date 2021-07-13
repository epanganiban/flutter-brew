import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          widget.tasks[index].name!,
          isChecked: widget.tasks[index].isDone,
          onChanged: (newValue) {
            setState(() {
              widget.tasks[index].isDone = newValue!;
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
