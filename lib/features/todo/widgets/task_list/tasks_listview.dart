import 'package:do_note/features/todo/widgets/task_list/task_container/task_container.dart';
import 'package:do_note/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/providers/selected_date_state.dart';

class TasksListView extends ConsumerStatefulWidget {
  const TasksListView({super.key});

  @override
  ConsumerState<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends ConsumerState<TasksListView> {
  @override
  Widget build(BuildContext context) {
    final allTasks = ref.watch(tasksStreamProvider);
    final selectedDate = ref.watch(selectedDateProvider);

    return allTasks.when(
      data: (tasks) => ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final notCompletedTasks = tasks.where((task) {
            return !task.isCompleted;
          });
          final filteredDateTasks = notCompletedTasks.where((task) {
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
          final task = filteredDateTasks[index];
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
                  child: TaskContainer(task: task),
                ),
              ),
            ),
          );
        },
      ),
      loading: () => const CircularProgressIndicator(),
      error: (e, st) => Text('Error: $e'),
    );
  }
}
