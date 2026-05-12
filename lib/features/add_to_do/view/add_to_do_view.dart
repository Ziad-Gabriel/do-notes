import 'package:do_note/core/utils/done_buttons/done_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/providers/priority_index.dart';
import 'package:do_note/core/widgets/buttons/cancel/cancel_button.dart';
import 'package:do_note/core/widgets/buttons/choose_date/choose_date.dart';
import 'package:do_note/core/widgets/buttons/choose_time/choose_time.dart';
import 'package:do_note/core/widgets/buttons/done/done_button.dart';
import 'package:do_note/features/add_to_do/widgets/task_priority/priority.dart';
import 'package:do_note/features/add_to_do/widgets/text_fields/description_text_field/description_text_field.dart';
import 'package:do_note/features/add_to_do/widgets/text_fields/title_text_field/title_text_field.dart';

class AddToDoView extends ConsumerStatefulWidget {
  const AddToDoView({super.key});

  @override
  ConsumerState<AddToDoView> createState() => _AddToDoViewState();
}

class _AddToDoViewState extends ConsumerState<AddToDoView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  DateTime? date;
  TimeOfDay? time;

  @override
  void dispose() {
    titleController.dispose();
    desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final priority = ref.watch(priorityProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Hero(
          tag: 'app bar title',
          child: Text('ToDo', style: Theme.of(context).textTheme.titleLarge),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: TweenAnimationBuilder(
          tween: Tween<Offset>(
            begin: const Offset(0, 200),
            end: const Offset(0, 0),
          ),
          duration: const Duration(milliseconds: 350),
          builder: (context, offset, child) {
            return Transform.translate(offset: offset, child: child);
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TitleTextField(titleController: titleController),
                  DescriptionTextField(desController: desController),
                  ChooseDate(
                    selectedDate: date,
                    onDatePicked: (selectedDate) {
                      setState(() {
                        date = selectedDate;
                      });
                    },
                  ),
                  ChooseTime(
                    selectedTime: time,
                    onTimePicked: (selectedTime) {
                      setState(() {
                        time = selectedTime;
                      });
                    },
                  ),
                  const TaskPriority(),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const CancelButton(),
                      DoneButton(
                        onPressed: addTask(
                          title: titleController,
                          description: desController,
                          date: date,
                          time: time,
                          priority: priority,
                          ref: ref,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
