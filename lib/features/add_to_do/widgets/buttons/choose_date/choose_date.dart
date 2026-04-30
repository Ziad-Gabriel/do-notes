import 'package:do_note/features/add_to_do/widgets/date_time_pickers/date_picker/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseDate extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDatePicked;

  const ChooseDate({
    super.key,
    required this.selectedDate,
    required this.onDatePicked,
  });

  @override
  State<ChooseDate> createState() => _ChooseDateState();
}

class _ChooseDateState extends State<ChooseDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text('Date', style: Theme.of(context).textTheme.bodyLarge),
        ),
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showCustomDatePicker(context);
            if (pickedDate != null) {
              widget.onDatePicked(pickedDate);
            }
          },
          child: Card(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Icon(Icons.edit_calendar_rounded),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.selectedDate == null
                            ? 'Pick Task Date'
                            : DateFormat.yMMMd().format(widget.selectedDate!),
                      ),
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
