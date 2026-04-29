import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/core/utils/selected_date_state.dart';

class DateSelection extends ConsumerStatefulWidget {
  const DateSelection({super.key});

  @override
  ConsumerState<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends ConsumerState<DateSelection> {
  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8),
      child: DatePicker(
        DateTime.now(),
        height: 120,
        width: 100,
        selectionColor: Theme.of(context).colorScheme.primary,
        initialSelectedDate: DateTime.now(),
        dayTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
        dateTextStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: Colors.grey,
        ),
        monthTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),

        onDateChange: (date) {
          setState(() {
            selectedDate.updateSelectedDate(date);
          });
        },
      ),
    );
  }
}
