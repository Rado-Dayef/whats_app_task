import 'package:flutter/material.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: AppFonts.roboto,
    splashColor: AppColors.transparent,
    highlightColor: AppColors.transparent,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.backgroundLight),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(splashFactory: NoSplash.splashFactory, overlayColor: WidgetStateProperty.all(Colors.transparent)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: AppFonts.roboto,
    splashColor: AppColors.transparent,
    highlightColor: AppColors.transparent,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.backgroundDark, brightness: Brightness.dark),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(splashFactory: NoSplash.splashFactory, overlayColor: WidgetStateProperty.all(Colors.transparent)),
    ),
  );
}
