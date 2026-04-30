import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  final TextEditingController title;
  final TextEditingController? description;
  // final DateTime? date;
  final int priority;

  const DoneButton({
    super.key,
    required this.title,
    required this.description,
    // required this.date,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text('Done', style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
