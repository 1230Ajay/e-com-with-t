import 'package:flutter/material.dart';
import 'package:tapp/core/utils/constants/sizes.dart';

import '../../constants/colors.dart';

class TIconButtonTheme {
  static const IconButtonThemeData lightIconButtonThemeData =
      IconButtonThemeData(
    style: ButtonStyle(
        iconColor:
            WidgetStatePropertyAll(AppColors.dark), // Set default icon color
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        fixedSize:
            WidgetStatePropertyAll(Size(AppSizes.iconMd, AppSizes.iconMd))),
  );

  static const IconButtonThemeData darkIconButtonThemeData =
      IconButtonThemeData(
    style: ButtonStyle(
        iconColor:
            WidgetStatePropertyAll(AppColors.white), // Set default icon color
        backgroundColor: WidgetStatePropertyAll(
            Colors.transparent), // Optional background color
        fixedSize:
            WidgetStatePropertyAll(Size(AppSizes.iconMd, AppSizes.iconMd))),
  );
}
