import 'package:flutter/material.dart';
import 'package:tapp/core/utils/constants/colors.dart';

class TElevatedButton {
  TElevatedButton._();

  //// -- Light & Dark Theme

  static final lightElevatedButton = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.light.withOpacity(0.8),
          disabledBackgroundColor: AppColors.primary.withOpacity(0.8),
          side: const BorderSide(color: AppColors.primary),
          padding: EdgeInsets.symmetric(vertical: 18),
          iconColor: Colors.white,
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));

  static final darkElevatedButton = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.light.withOpacity(0.8),
          disabledBackgroundColor: AppColors.primary.withOpacity(0.8),
          side: const BorderSide(color: AppColors.primary),
          padding: EdgeInsets.symmetric(vertical: 18),
          iconColor: Colors.white,
          textStyle: const TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))));
}
