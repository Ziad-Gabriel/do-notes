import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionTextField extends StatefulWidget {
  const DescriptionTextField({super.key});

  @override
  State<DescriptionTextField> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 6,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Description',
        labelStyle: GoogleFonts.viga(fontSize: 16, fontWeight: FontWeight.w300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            width: 5,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
