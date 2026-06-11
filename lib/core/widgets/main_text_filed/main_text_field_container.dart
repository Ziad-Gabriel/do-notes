import 'package:do_note/core/widgets/main_text_filed/main_text_field.dart';
import 'package:flutter/material.dart';

class MainTextFieldContainer extends StatelessWidget {
  final String title;
  final Icon icon;
  final TextEditingController controller;
  final int maxLines;
  final String hintText;
  final TextInputType keyBoardType;

  const MainTextFieldContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.maxLines,
    required this.hintText,
    required this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        ),
        const SizedBox(height: 0),
        Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 2,
              bottom: 2,
              top: 2,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.only(left: 8.0), child: icon),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainTextField(
                      controller: controller,
                      maxLines: maxLines,
                      hintText: hintText,
                      keyBoardType: keyBoardType,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
