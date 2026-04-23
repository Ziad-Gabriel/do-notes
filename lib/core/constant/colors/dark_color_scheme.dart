import 'package:flutter/material.dart';
import 'package:do_note/core/constant/colors/const_colors.dart';

class DarkColorScheme {

  static ColorScheme get darkColorScheme{
    return ColorScheme.dark(
      brightness: Brightness.dark,
      primary: primaryColor,
      surface: Color(0XFF0D0D0D),
    );
  }
}