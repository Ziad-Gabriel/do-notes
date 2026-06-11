import 'package:flutter/material.dart';

import 'package:do_note/core/constant/colors/light_color_scheme.dart';
import 'package:do_note/core/constant/text/texts_styles.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor:const Color(0xFFEBEBEB),
    colorScheme: LightColorScheme.lightColorScheme,
    textTheme: TextsStyles().appTextTheme,
  );
}
