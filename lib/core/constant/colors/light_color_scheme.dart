import 'package:flutter/material.dart';
import 'package:do_note/core/constant/colors/const_colors.dart';

class LightColorScheme {
  static ColorScheme get lightColorScheme {
    return const ColorScheme.light(
      brightness: Brightness.light,
      primary: primaryColor,
      surface: Color(0xFFF4F4F4),
      primaryContainer:  Color.fromARGB(255, 235, 235, 235),
      onPrimary: Color(0XFF0D0D0D),
    );
  }
}
