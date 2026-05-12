import 'package:flutter/material.dart';

class TitleEditor extends StatefulWidget {
  final TextEditingController titleController;

  const TitleEditor({super.key, required this.titleController});

  @override
  State<TitleEditor> createState() => _TitleEditorState();
}

class _TitleEditorState extends State<TitleEditor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: widget.titleController,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          label: const Text('Edit Title'),
          labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
          ),
        ),
      ),
    );
  }
}
