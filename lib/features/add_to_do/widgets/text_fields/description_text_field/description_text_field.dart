import 'package:do_note/core/widgets/main_text_filed/main_text_field_container.dart';
import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {

  final TextEditingController controller;
  const DescriptionTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return 
        MainTextFieldContainer(
          title: 'Description (optional)',
          icon: const Icon(Icons.description_rounded),
          controller: controller,
          maxLines: 3,
          hintText: 'Enter description',
          keyBoardType: TextInputType.multiline,
       
    );
  }
}
