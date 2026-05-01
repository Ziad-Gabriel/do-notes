import 'package:do_note/features/todo/data/tasks_data.dart';
import 'package:do_note/features/todo/widgets/task_list/content/task_description.dart';
import 'package:do_note/features/todo/widgets/task_list/content/task_end_date.dart';
import 'package:do_note/features/todo/widgets/task_list/content/task_title.dart';
import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {

  final TaskData task;
  const TaskContainer({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TaskTitle(title: task.title),
                                // SizedBox(height: 4),
                                TaskDescription(description: task.description),
                                TaskEndDate(endDate: task.endDate),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
  }
}