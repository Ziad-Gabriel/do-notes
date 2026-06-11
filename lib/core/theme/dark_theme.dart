import 'package:flutter/material.dart';

import 'package:do_note/core/constant/colors/dark_color_scheme.dart';
import 'package:do_note/core/constant/text/texts_styles.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor:const Color(0xFF1E1E1E),
    colorScheme: DarkColorScheme.darkColorScheme,
    textTheme: TextsStyles().appTextTheme,
  );
}
