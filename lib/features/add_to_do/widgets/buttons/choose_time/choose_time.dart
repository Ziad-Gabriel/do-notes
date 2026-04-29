import 'package:flutter/material.dart';

class ChooseTime extends StatefulWidget {
  const ChooseTime({super.key});

  @override
  State<ChooseTime> createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text('Time', style: Theme.of(context).textTheme.bodyLarge),
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
                  Icon(Icons.watch_later_outlined),
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
