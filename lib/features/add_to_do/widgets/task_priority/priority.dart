import 'package:do_note/features/add_to_do/state/priority_index.dart';
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
    final priority = ref.watch(priorityProvider);
    final setPriority = ref.read(priorityProvider.notifier).setPriority;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority', style: Theme.of(context).textTheme.bodyLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setPriority(0),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    height: priority == 0 ? 0 : 92,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Low',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => setPriority(1),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    height: priority == 1 ? 0 : 92,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'Medium',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => setPriority(2),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    height: priority == 2 ? 0 : 92,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      'High',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
