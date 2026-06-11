import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainButton extends ConsumerWidget {
  final Function() onPressed;
  final String title;

  const MainButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
