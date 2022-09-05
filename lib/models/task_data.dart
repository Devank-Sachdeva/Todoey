import 'package:flutter/foundation.dart';
import 'package:todoey/models/Task.dart';
import 'package:hive/hive.dart';

class TaskData extends ChangeNotifier {
  var box = Hive.box<Task>('tasks');
  List<Task> tasks = Hive.box<Task>('tasks').values.toList();

  int get count {
    return box.length;
  }

  void addTaskToList(String newTask) {
    box.add(Task(taskTitle: newTask));
    tasks = Hive.box<Task>('tasks').values.toList();
    notifyListeners();
  }

  void checkOf(int index) {
    Task? ini = box.getAt(index);
    Task? update = Task(taskTitle: ini?.taskTitle ?? ' ', isDone: !ini!.isDone);
    box.putAt(index, update);
    tasks = Hive.box<Task>('tasks').values.toList();
    notifyListeners();
  }

  void deleteTask(int index) {
    box.deleteAt(index);
    tasks = Hive.box<Task>('tasks').values.toList();
    notifyListeners();
  }
}
