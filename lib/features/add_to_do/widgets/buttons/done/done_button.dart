import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text('Done', style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
