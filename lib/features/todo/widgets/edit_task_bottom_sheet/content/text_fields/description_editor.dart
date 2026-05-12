import 'package:flutter/material.dart';

class DescriptionEditor extends StatefulWidget {
  final TextEditingController descriptionController;

  const DescriptionEditor({super.key, required this.descriptionController});

  @override
  State<DescriptionEditor> createState() => _DescriptionEditorState();
}

class _DescriptionEditorState extends State<DescriptionEditor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: widget.descriptionController,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          label: const Text('Edit Description'),
          labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
          ),
        ),
      ),
    );
  }
}
