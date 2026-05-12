import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskEndDate extends StatelessWidget {
  final DateTime endDate;

  const TaskEndDate({super.key, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.watch_later_outlined),
        const SizedBox(width: 4),
        Text(
          DateFormat.yMMMd().format(endDate),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 4),
        (endDate.hour == 0 && endDate.minute == 0)
            ? const SizedBox.shrink()
            : Text(
                DateFormat.jm().format(endDate),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ],
    );
  }
}
