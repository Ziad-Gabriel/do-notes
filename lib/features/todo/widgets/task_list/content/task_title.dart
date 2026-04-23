import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final String title;
  const TaskTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
