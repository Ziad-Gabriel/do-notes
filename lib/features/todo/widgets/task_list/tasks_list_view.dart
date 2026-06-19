import 'package:do_note/core/constants/colors/const_colors.dart';
import 'package:do_note/features/todo/widgets/task_list/content/buttons/delete_button.dart';
import 'package:do_note/features/todo/widgets/task_list/content/buttons/edit_button.dart';
import 'package:do_note/features/todo/widgets/task_list/task_container/task_container.dart';
import 'package:do_note/core/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/core/providers/selected_date_state.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TasksListView extends ConsumerWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      key: ValueKey(task.id),
                      padding: const EdgeInsets.only(bottom: 2),
                      child: IntrinsicHeight(
                        child: Card(
                          elevation: 2,
                          color: priorityColors[task.priority],
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Slidable(
                              direction: Axis.horizontal,
                              startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                extentRatio: 0.35,
                                children: [
                                  deleteButton(task, ref, context),
                                  editButton(task, ref, context),
                                ],
                              ),
                              child: TaskContainer(task: task),
                            ),
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
      loading: () =>
          const  Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }
}
