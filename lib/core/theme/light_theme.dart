import 'package:flutter/material.dart';

import 'package:do_note/core/constant/colors/light_color_scheme.dart';
import 'package:do_note/core/constant/text/texts_styles.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFF4F4F4),
    colorScheme: LightColorScheme.lightColorScheme,
    textTheme: TextsStyles().appTextTheme,
  );
}
