import 'package:flutter/material.dart';

class NoteTitleTextField extends StatelessWidget {
  final TextEditingController controller;
  const NoteTitleTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          maxLines: 1,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            hintText: 'Enter title',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
