import 'package:do_note/core/widgets/main_text_filed/main_text_field_container.dart';
import 'package:flutter/material.dart';

class TitleTextField extends StatelessWidget {
  final TextEditingController controller;
  const TitleTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MainTextFieldContainer(
      title: 'Title',
      icon: const Icon(Icons.title_rounded),
      controller: controller,
      maxLines: 1,
      hintText: 'Enter task title',
      keyBoardType: TextInputType.text,
    );
  }
}
