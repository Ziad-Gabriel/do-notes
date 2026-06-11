import 'package:do_note/core/widgets/main_text_filed/main_text_field_container.dart';
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
    return MainTextFieldContainer(
      title: 'Edit Description',
      icon: const Icon(Icons.title_rounded),
      controller: widget.descriptionController,
      maxLines: 1,
      hintText: 'Edit description',
      keyBoardType: TextInputType.text,
    );
  }
}
