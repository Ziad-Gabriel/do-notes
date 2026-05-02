import 'package:do_note/providers/priority_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChoosePriorityStyle extends ConsumerStatefulWidget {
  final int priorityIndex;
  const ChoosePriorityStyle({super.key, required this.priorityIndex});

  @override
  ConsumerState<ChoosePriorityStyle> createState() =>
      _ChoosePriorityStyleState();
}

class _ChoosePriorityStyleState extends ConsumerState<ChoosePriorityStyle> {
  @override
  Widget build(BuildContext context) {
    final priority = ref.watch(priorityProvider);
    final setPriority = ref.read(priorityProvider.notifier).setPriority;
    return GestureDetector(
      onTap: () => setPriority(widget.priorityIndex),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 100,
            width: 80,
            decoration: BoxDecoration(
              color: widget.priorityIndex == 0
                  ? Colors.blue
                  : widget.priorityIndex == 1
                  ? Colors.yellow
                  : Colors.red,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            height: priority == widget.priorityIndex ? 0 : 92,
            width: 80,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              widget.priorityIndex == 0
                  ? 'Low'
                  : widget.priorityIndex == 1
                  ? 'Medium'
                  : 'High',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
