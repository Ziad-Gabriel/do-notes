import 'package:do_note/features/todo/widgets/task_list/task_container/task_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/core/utils/selected_date_state.dart';
import 'package:do_note/features/todo/data/tasks_data.dart';


class TasksListView extends ConsumerStatefulWidget {
  const TasksListView({super.key});

  @override
  ConsumerState<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends ConsumerState<TasksListView> {
  @override
  Widget build(BuildContext context) {
    final allTasks = ref.watch(tasksDataProvider);
    final selectedDate = ref.watch(selectedDateProvider);
    final filteredTasks = allTasks.where((task) {
      if (DateTime.now().year == selectedDate.year &&
          DateTime.now().month == selectedDate.month &&
          DateTime.now().day == selectedDate.day) {
        return task.endDate.year <= selectedDate.year &&
            task.endDate.month <= selectedDate.month &&
            task.endDate.day <= selectedDate.day;
      } else {
        return task.endDate.year == selectedDate.year &&
            task.endDate.month == selectedDate.month &&
            task.endDate.day == selectedDate.day;
      }
    }).toList();

    return ListView.builder(
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        final task = filteredTasks[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: IntrinsicHeight(
            child: Card(
              elevation: 2,
              color: task.priority == 0
                  ? Colors.blue
                  : task.priority == 1
                  ? Colors.yellow
                  : Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: TaskContainer(task: task,),
              ),
            ),
          ),
        );
      },
    );
  }
}
