import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final Widget Function(BuildContext, int) builder;
  final int itemCount;

  TasksList({required this.builder, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: builder,
      itemCount: itemCount,
    );
  }
}
