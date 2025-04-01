import 'package:flutter/material.dart';
import 'package:tapp/core/utils/constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipThemeData = ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: const TextStyle(color: Colors.black),
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
    selectedColor: AppColors.primary,
  );

  static ChipThemeData darkChipThemeData = ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: AppColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );
}
