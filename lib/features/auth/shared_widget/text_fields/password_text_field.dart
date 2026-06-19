import 'package:flutter/material.dart';

import 'package:do_note/core/widgets/main_text_filed/main_text_field_container.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Password text field',
      child: MainTextFieldContainer(
        title: 'Password',
        icon: const Icon(Icons.lock_person_rounded),
        controller: controller,
        maxLines: 1,
        hintText: 'Enter your password',
        keyBoardType: TextInputType.text,
      ),
    );
  }
}
