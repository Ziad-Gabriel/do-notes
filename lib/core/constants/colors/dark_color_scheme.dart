import 'package:flutter/material.dart';
import 'package:do_note/core/constants/colors/const_colors.dart';

class DarkColorScheme {
  static ColorScheme get darkColorScheme {
    return const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: primaryColor,
      surface:Color(0xFF1E1E1E) ,
      primaryContainer:  Color(0XFF0D0D0D),
      onPrimary: Color(0xFFF4F4F4),
      error: cancelButton
    );
  }
}
