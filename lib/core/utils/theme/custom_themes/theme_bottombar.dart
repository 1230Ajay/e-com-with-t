import 'package:flutter/material.dart';

class TBottomBarTheme {
  static NavigationBarThemeData lightNavigationBarThemeData =
      NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Colors.black.withOpacity(0.1));

  static NavigationBarThemeData darkNavigationBarThemeData =
      NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: Colors.white.withOpacity(0.1));
}
