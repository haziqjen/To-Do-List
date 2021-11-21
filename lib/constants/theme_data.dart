import 'package:flutter/material.dart';

import 'constant.dart';

abstract class AppTheme {


  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: ConstantValue.primaryColor,
    fontFamily: 'Bulo Rounded Regular'
  );

  static ThemeData dark = ThemeData(brightness: Brightness.dark);
}