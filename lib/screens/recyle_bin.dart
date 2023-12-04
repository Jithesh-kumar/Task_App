import 'package:flutter/material.dart';
import 'package:flutter_task_app/screens/my_drawer.dart';
import 'package:flutter_task_app/widgets/task_list.dart';

import '../blocs/bloc_exports.dart';

class RecyleBin extends StatelessWidget {
  const RecyleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(Icons.delete_forever),
                            label: const Text('Delete all tasks'),
                          ),
                          onTap: () => context.read<TaskBloc>().add(
                                DeleteAllTask(),
                              ),
                        )
                      ])
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(' ${state.removedTasks.length}Tasks'),
                ),
              ),
              TaskList(taskList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
