import 'package:flutter/material.dart';

class NoteContent extends StatelessWidget {
  final String content;
  const NoteContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,

      style: Theme.of(context).textTheme.bodySmall,
      overflow: TextOverflow.fade,
    );
  }
}
