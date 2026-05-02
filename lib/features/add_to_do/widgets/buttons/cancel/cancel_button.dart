import 'package:do_note/providers/priority_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CancelButton extends ConsumerWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priority = ref.read(priorityProvider.notifier).setPriority;
    return ElevatedButton(
      onPressed: () {
        priority(1);
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.error,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text('Cancel', style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
