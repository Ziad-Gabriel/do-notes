import 'package:flutter/material.dart';

class NoteTitle extends StatelessWidget {
  final String title;
  const NoteTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
      overflow: TextOverflow.ellipsis,
    );
  }
}
