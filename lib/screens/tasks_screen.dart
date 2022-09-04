import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: SizedBox(
        width: 80.0,
        height: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(),
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              size: 30,
              color: kBlueBG,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60.0, bottom: 40.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: kBlueBG,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'TODOEY',
                  style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.w900, color: kBlueBG),
                ),
                Text(
                  '${Provider.of<TaskData>(context).count} Tasks',
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900, color: kBlueBG),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: kBlueBG,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: const TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
