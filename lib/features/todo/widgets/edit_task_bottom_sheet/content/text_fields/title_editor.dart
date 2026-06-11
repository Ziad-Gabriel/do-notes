import 'package:do_note/core/widgets/main_text_filed/main_text_field_container.dart';
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
    return MainTextFieldContainer(
      title: 'Edit Title',
      icon: const Icon(Icons.title_rounded),
      controller: widget.titleController,
      maxLines: 1,
      hintText: 'Edit title',
      keyBoardType: TextInputType.text,
    );
  }
}
