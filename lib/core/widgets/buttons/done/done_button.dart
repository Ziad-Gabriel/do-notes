import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class DoneButton extends ConsumerWidget {

  final Function() onPressed;

  const DoneButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text('Done', style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
