import 'package:flutter/material.dart';
import 'package:do_note/core/constant/colors/const_colors.dart';

class LightColorScheme {

  static ColorScheme get lightColorScheme{
    return ColorScheme.light(
      brightness: Brightness.light,
      primary: primaryColor,
      surface: Color(0xFFF4F4F4),
    );
  }
}