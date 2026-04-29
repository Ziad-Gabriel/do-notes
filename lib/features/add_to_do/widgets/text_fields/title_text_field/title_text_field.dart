import 'package:flutter/material.dart';

class TitleTextField extends StatefulWidget {
  const TitleTextField({super.key});

  @override
  State<TitleTextField> createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<TitleTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            'Task Title',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: Icon(Icons.title),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter Title',
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
