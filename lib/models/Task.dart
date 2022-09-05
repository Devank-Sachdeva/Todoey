import 'package:hive/hive.dart';

part 'Task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String taskTitle;
  @HiveField(1)
  bool isDone;

  Task({required this.taskTitle, this.isDone = false});

  // void changeState() {
  //   isDone = !isDone;
  // }
}
