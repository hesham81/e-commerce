import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryColor,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: AppColors.darkBlueColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'DMSans',
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkBlueColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: 'DMSans',
      ),
      displayMedium: TextStyle(
        color: AppColors.shadeGreyColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'DMSans',
      ),
      titleSmall: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: 'DMSans',
      ),
    ),
    buttonTheme: ButtonThemeData(
      padding: EdgeInsets.zero,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),
  );
}
