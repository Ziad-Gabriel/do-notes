import 'package:do_note/features/add_to_do/widgets/date_time_pickers/time_picker/time_picker.dart';
import 'package:flutter/material.dart';

class ChooseTime extends StatefulWidget {
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay) onTimePicked;
  const ChooseTime({
    super.key,
    required this.selectedTime,
    required this.onTimePicked,
  });

  @override
  State<ChooseTime> createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:const EdgeInsets.only(left: 12),
          child: Text('Time', style: Theme.of(context).textTheme.bodyLarge),
        ),
        GestureDetector(
          onTap: () async {
            TimeOfDay? pickedTime = await showCustomTimePicker(context);
            if (pickedTime != null) {
              widget.onTimePicked(pickedTime);
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
                  const Icon(Icons.watch_later_outlined),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.selectedTime == null
                            ? 'Pick Task Time'
                            : widget.selectedTime!.format(context),
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
