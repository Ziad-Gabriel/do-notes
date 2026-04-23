import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:do_note/features/add_to_do/widgets/text_fields/description_text_field.dart';
import 'package:do_note/features/add_to_do/widgets/text_fields/title_text_field.dart';

class AddToDoView extends StatelessWidget {
  const AddToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add ToDo',
          style: GoogleFonts.viga(fontSize: 26, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TitleTextField(),
            SizedBox(height: 16),
            DescriptionTextField(),
          ],
        ),
      ),
    );
  }
}
