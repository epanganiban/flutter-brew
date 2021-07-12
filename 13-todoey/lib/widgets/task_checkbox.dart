import 'package:flutter/material.dart';

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function(bool?)? onChanged;

  TaskCheckbox({required this.checkboxState, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: onChanged,
    );
  }
}