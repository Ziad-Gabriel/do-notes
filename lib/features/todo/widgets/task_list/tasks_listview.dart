import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:z_money/core/utils/selected_date_state.dart';

import 'package:z_money/features/todo/data/tasks_data.dart';
import 'package:z_money/features/todo/widgets/task_list/content/completed_box.dart';
import 'package:z_money/features/todo/widgets/task_list/content/task_description.dart';
import 'package:z_money/features/todo/widgets/task_list/content/task_end_date.dart';
import 'package:z_money/features/todo/widgets/task_list/content/task_title.dart';

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
      return task.endDate.year == selectedDate.year &&
          task.endDate.month == selectedDate.month &&
          task.endDate.day == selectedDate.day;
    }).toList();

    return ListView.builder(
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        final task = filteredTasks[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Card(
              elevation: 8,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TaskTitle(title: task.title),
                              TaskEndDate(endDate: task.endDate),
                              TaskDescription(description: task.description),
                            ],
                          ),
                        ),
                      ),
                      CompletedBox(isCompleted: task.isCompleted),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
