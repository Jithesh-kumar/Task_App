import 'package:flutter/material.dart';
import 'package:flutter_task_app/models/task.dart';

//import 'package:flutter_task_app/screens/add_task_screen.dart';
import 'package:flutter_task_app/widgets/task_list.dart';

import '../blocs/bloc_exports.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';

  // List<Task> taskList = [
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.favoriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text('${taskList.length} Tasks'),
              ),
            ),
            TaskList(taskList: taskList)
          ],
        );
      },
    );
  }
}
