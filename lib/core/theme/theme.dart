import 'package:flutter/material.dart';
import 'package:whats_app_task/core/theme/colors.dart';
import 'package:whats_app_task/core/theme/fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(fontFamily: AppFonts.roboto, splashColor: AppColors.transparent, highlightColor: AppColors.transparent, scaffoldBackgroundColor: AppColors.backgroundDark);

  static ThemeData darkTheme = ThemeData(fontFamily: AppFonts.roboto, splashColor: AppColors.transparent, highlightColor: AppColors.transparent, scaffoldBackgroundColor: AppColors.backgroundDark);
}
