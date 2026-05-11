import 'package:do_note/features/add_to_do/widgets/task_priority/choose_priority_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskPriority extends ConsumerStatefulWidget {
  const TaskPriority({super.key});

  @override
  ConsumerState<TaskPriority> createState() => _TaskPriorityState();
}

class _TaskPriorityState extends ConsumerState<TaskPriority> {
  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority', style: Theme.of(context).textTheme.bodyLarge),
       const  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ChoosePriorityStyle(priorityIndex: 0),
            ChoosePriorityStyle(priorityIndex: 1),
            ChoosePriorityStyle(priorityIndex: 2),
          ],
        ),
      ],
    );
  }
}
