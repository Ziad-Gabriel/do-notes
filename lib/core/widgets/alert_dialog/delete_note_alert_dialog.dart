import 'package:flutter/material.dart';

AlertDialog customDeleteAlertDialog(BuildContext context,Function delete) {
  return AlertDialog(
    title: const Text('Delete Note'),
    content: const Text("Are you sure you want to delete this note?"),
    actions: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: Theme.of(context).textTheme.bodySmall),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              delete();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Delete',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    ],
  );
}
