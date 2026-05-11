import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/providers/selected_date_state.dart';

class DateSelection extends ConsumerWidget {
  const DateSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedDate = ref.watch(selectedDateProvider.notifier);
    return Container(
      color: colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: DatePicker(
          DateTime.now(),
          height: 120,
          width: 100,
          selectionColor: const Color.fromARGB(255, 214, 214, 214),
          selectedTextColor: Colors.black,
          initialSelectedDate: DateTime.now(),
          dayTextStyle:const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color:  Color.fromARGB(255, 79, 79, 79),
          ),
          dateTextStyle: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color:  Color.fromARGB(255, 79, 79, 79),
          ),
          monthTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color:  Color.fromARGB(255, 79, 79, 79),
          ),

          onDateChange: (date) {
            selectedDate.updateSelectedDate(date);
          },
        ),
      ),
    );
  }
}
