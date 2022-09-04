import 'package:flutter/foundation.dart';
import 'package:todoey/models/Task.dart';
import 'package:collection/collection.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(taskTitle: 'Do Homework'),
    Task(taskTitle: 'Code'),
    Task(taskTitle: 'Shit yourself'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get count {
    return _tasks.length;
  }

  void addTaskToList(String newTask) {
    _tasks.add(Task(taskTitle: newTask));
    notifyListeners();
  }

  void checkOf(Task task) {
    task.changeState();
    notifyListeners();
  }

  void deleteTask(Task yeet) {
    _tasks.remove(yeet);
    notifyListeners();
  }
}
