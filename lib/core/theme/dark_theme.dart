import 'package:flutter/material.dart';

import 'package:do_note/core/constant/colors/dark_color_scheme.dart';
import 'package:do_note/core/constant/text/texts_styles.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0XFF0D0D0D),
    colorScheme: DarkColorScheme.darkColorScheme,
    textTheme: TextsStyles().appTextTheme,
  );
}
