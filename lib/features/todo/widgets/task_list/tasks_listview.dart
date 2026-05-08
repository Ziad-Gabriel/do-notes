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
    final allTasks = ref.watch(tasksProvider);
    final selectedDate = ref.watch(selectedDateProvider);

    return allTasks.when(
      data: (tasks) {
        final filteredDateTasks = tasks.where((task) {
          if (task.isCompleted) return false;

          bool isToday = DateUtils.isSameDay(DateTime.now(), selectedDate);
          if (isToday) {
            return task.endDate.isBefore(selectedDate) ||
                DateUtils.isSameDay(task.endDate, selectedDate);
          } else {
            return DateUtils.isSameDay(task.endDate, selectedDate);
          }
        }).toList();

        return Column(
          children: [
            Text('Tasks', style: Theme.of(context).textTheme.titleLarge),

            if (filteredDateTasks.isEmpty)
              const Expanded(
                child: Center(child: Text("No tasks for this day")),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: filteredDateTasks.length,
                  itemBuilder: (context, index) {
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
              ),
          ],
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
error: (e, st) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }
}
