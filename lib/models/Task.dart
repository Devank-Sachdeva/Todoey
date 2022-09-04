class Task {
  late String taskTitle;
  bool isDone;

  Task({required this.taskTitle, this.isDone = false});

  void changeState() {
    isDone = !isDone;
  }
}
