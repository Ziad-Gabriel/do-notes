import 'package:flutter/material.dart';

Future<TimeOfDay?> showCustomTimePicker(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: 12, minute: 0),
  );
}
