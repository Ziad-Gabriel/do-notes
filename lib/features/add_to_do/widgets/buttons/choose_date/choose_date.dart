import 'package:flutter/material.dart';

class ChooseDate extends StatefulWidget {
  const ChooseDate({super.key});

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text('Date', style: Theme.of(context).textTheme.bodyLarge),
        ),
        GestureDetector(
          child: Card(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Icon(Icons.edit_calendar_rounded),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Date'),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
