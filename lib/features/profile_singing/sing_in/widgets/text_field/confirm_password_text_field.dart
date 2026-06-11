import 'package:flutter/material.dart';

import 'package:do_note/core/widgets/main_text_filed/main_text_field_container.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  const ConfirmPasswordTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MainTextFieldContainer(
      title: 'Confirm password',
      icon: const Icon(Icons.done_all_rounded),
      controller: controller,
      maxLines: 1,
      hintText: 'Confirm your password',
      keyBoardType: TextInputType.text,
    );
  }
}
