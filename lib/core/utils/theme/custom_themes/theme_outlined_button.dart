import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TOutLinedButtonTheme {
  TOutLinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black, // Ensure text is visible in light mode
      side: const BorderSide(color: AppColors.primary),
      padding: EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static OutlinedButtonThemeData darkOutLinedButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      padding: EdgeInsets.symmetric(vertical: 18),
      foregroundColor: Colors.white, // Ensure text is visible in dark mode
      side: const BorderSide(color: AppColors.primary),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
