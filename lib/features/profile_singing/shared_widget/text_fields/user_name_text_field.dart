import 'package:flutter/material.dart';

import 'package:do_note/core/widgets/main_text_filed/main_text_field_container.dart';

class UserNameTextField extends StatelessWidget {
  final TextEditingController controller;
  const UserNameTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'User name text field',
      child: MainTextFieldContainer(
        title: 'User name',
        icon: const Icon(Icons.person_2_rounded),
        controller: controller,
        maxLines: 1,
        hintText: 'Enter your user name',
        keyBoardType: TextInputType.name,
      ),
    );
  }
}
