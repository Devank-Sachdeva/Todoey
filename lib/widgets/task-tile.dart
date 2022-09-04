import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final void Function(bool?) changeState;
  final VoidCallback taskDeleter;
  const TasksTile(
      {this.isChecked = false, required this.taskTitle, required this.changeState, required this.taskDeleter});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          taskTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            decoration: (isChecked) ? TextDecoration.lineThrough : null,
            decorationColor: Colors.black,
            decorationThickness: 4,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          side: const BorderSide(color: Colors.white),
          onChanged: changeState,
        ),
        onLongPress: taskDeleter);
  }
}
