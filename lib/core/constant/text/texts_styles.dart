import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextsStyles {
  final TextStyle appTextStyle = GoogleFonts.alkatra();

  TextTheme get appTextTheme {
    return TextTheme(
      titleLarge: appTextStyle.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: appTextStyle.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: appTextStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: appTextStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
