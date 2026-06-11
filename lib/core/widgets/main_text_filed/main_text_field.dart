import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final String hintText;
  final TextInputType keyBoardType;

  const MainTextField({
    super.key,
    required this.controller,
    required this.maxLines,
    required this.hintText,
    required this.keyBoardType
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onPrimary.withAlpha(150),
        ),
      ),
    );
  }
}
