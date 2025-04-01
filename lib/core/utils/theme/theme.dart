import 'package:flutter/material.dart';
import 'package:tapp/core/utils/constants/colors.dart';
import 'package:tapp/core/utils/theme/custom_themes/theme_appbar.dart';
import 'package:tapp/core/utils/theme/custom_themes/theme_bottom_sheet.dart';
import 'package:tapp/core/utils/theme/custom_themes/theme_bottombar.dart';
import 'package:tapp/core/utils/theme/custom_themes/theme_chip.dart';
import 'package:tapp/core/utils/theme/custom_themes/theme_elevated_button.dart';
import 'package:tapp/core/utils/theme/custom_themes/theme_icon_button.dart';
import 'package:tapp/core/utils/theme/custom_themes/theme_outlined_button.dart';
import 'package:tapp/core/utils/theme/custom_themes/theme_text.dart';
import 'package:tapp/core/utils/theme/custom_themes/theme_text_field.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTheme,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: TBotttomSheetTheme.lightBottomSheetThemeData,
      chipTheme: TChipTheme.lightChipThemeData,
      elevatedButtonTheme: TElevatedButton.lightElevatedButton,
      outlinedButtonTheme: TOutLinedButtonTheme.lightOutlinedButtonThemeData,
      inputDecorationTheme: TTextFieldTheme.lightTextField,
      iconButtonTheme: TIconButtonTheme.lightIconButtonThemeData,
      navigationBarTheme: TBottomBarTheme.lightNavigationBarThemeData);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: "Poppins",
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: TBotttomSheetTheme.darkBottomSheetThemeData,
      chipTheme: TChipTheme.darkChipThemeData,
      elevatedButtonTheme: TElevatedButton.darkElevatedButton,
      outlinedButtonTheme: TOutLinedButtonTheme.darkOutLinedButtonThemeData,
      inputDecorationTheme: TTextFieldTheme.darkTextField,
      iconButtonTheme: TIconButtonTheme.darkIconButtonThemeData,
      navigationBarTheme: TBottomBarTheme.darkNavigationBarThemeData);
}
