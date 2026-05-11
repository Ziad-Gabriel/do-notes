import 'package:flutter/material.dart';

Future<TimeOfDay?> showCustomTimePicker(BuildContext context) async {
  return await showTimePicker(
    context: context,
    initialTime:const TimeOfDay(hour: 12, minute: 0),
  );
}
