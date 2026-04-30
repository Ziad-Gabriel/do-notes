import 'package:flutter/material.dart';

class DescriptionTextField extends StatefulWidget {
  final TextEditingController desController;
  const DescriptionTextField({super.key, required this.desController});

  @override
  State<DescriptionTextField> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 4),
          child: Text(
            'Description (optional)',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Card(
          color: Theme.of(context).colorScheme.surface,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 2,
              bottom: 2,
              top: 2,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8),
                  child: Icon(Icons.description_rounded),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: widget.desController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter Description',
                        hintStyle: Theme.of(context).textTheme.bodyLarge!
                            .copyWith(
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimary.withAlpha(150),
                            ),
                      ),
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
