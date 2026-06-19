import 'package:do_note/core/constants/colors/const_colors.dart';
import 'package:flutter/material.dart';

class EditPriority extends StatefulWidget {
  final int selectedPriority;
  final int priority;
  final Function() onTap;
  const EditPriority({
    super.key,
    required this.selectedPriority,
    required this.priority,
    required this.onTap,
  });

  @override
  State<EditPriority> createState() => _EditPriorityState();
}

class _EditPriorityState extends State<EditPriority> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
    
          widget.onTap();

      },
      child: CircleAvatar(
        radius: 24,
        backgroundColor: priorityColors[widget.priority],
        child: Icon(
          widget.selectedPriority == widget.priority
              ? Icons.check_rounded
              : null,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
