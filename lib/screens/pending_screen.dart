import 'package:flutter/material.dart';
import 'package:flutter_task_app/models/task.dart';

//import 'package:flutter_task_app/screens/add_task_screen.dart';
import 'package:flutter_task_app/widgets/task_list.dart';

import '../blocs/bloc_exports.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);
  static const id = 'tasks_screen';

  // List<Task> taskList = [
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                    '${taskList.length} Pending| ${state.completedTasks.length} Completed'),
              ),
            ),
            TaskList(taskList: taskList)
          ],
        );
      },
    );
  }
}
