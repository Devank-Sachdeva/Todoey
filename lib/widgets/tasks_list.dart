import 'package:flutter/material.dart';
import 'package:todoey/widgets/task-tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        padding: const EdgeInsets.only(top: 60.0, bottom: 40.0, left: 30.0, right: 30.0),
        itemBuilder: (context, index) {
          final currentTask = taskData.tasks[index];
          return TasksTile(
            taskTitle: currentTask.taskTitle,
            isChecked: currentTask.isDone,
            changeState: (newValue) {
              taskData.checkOf(currentTask);
            },
            taskDeleter: () {
              taskData.deleteTask(currentTask);
            },
          );
        },
        itemCount: taskData.count,
      );
    });
  }
}
