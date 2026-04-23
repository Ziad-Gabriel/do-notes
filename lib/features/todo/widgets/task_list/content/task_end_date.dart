import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskEndDate extends StatelessWidget {
  final DateTime endDate;
  const TaskEndDate({super.key, required this.endDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(121, 136, 136, 136),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        DateFormat('MMM dd, yyyy').format(endDate),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
