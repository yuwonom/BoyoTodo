import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get main => ThemeData(
      fontFamily: 'Roboto',
      primaryColor: AppColors.white,
      accentColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.white,
      cardColor: AppColors.white,
      errorColor: AppColors.white,
      indicatorColor: AppColors.lightGray,
    );
}

class AppColors {
  static Color get transparent => const Color(0x00000000);
  static Color get black => const Color(0xFF161616);
  static Color get white => const Color(0xFFFFFFFF);
  static Color get red => const Color(0xFFC0392B);
  static Color get borders => const Color(0xFFE9E9E9);
  static Color get lightGray => const Color(0xFFDADADA);
  static Color get darkGray => const Color(0xFF6E6E6E);
}

class AppTextStyles {
  static TextStyle get header1 => TextStyle(fontSize: 24, fontFamily: 'Roboto', fontWeight: FontWeight.bold);
  static TextStyle get header2 => TextStyle(fontSize: 20, letterSpacing: 0.25, fontFamily: 'Roboto', fontWeight: FontWeight.bold);
  static TextStyle get subtitle1 => TextStyle(fontSize: 16, letterSpacing: 0.15, fontFamily: 'Roboto', fontWeight: FontWeight.bold);
  static TextStyle get subtitle2 => TextStyle(fontSize: 14, letterSpacing: 0.1, fontFamily: 'Roboto', fontWeight: FontWeight.bold);
  static TextStyle get body1 => TextStyle(fontSize: 16, letterSpacing: 0.5, fontFamily: 'Roboto');
  static TextStyle get body2 => TextStyle(fontSize: 14, letterSpacing: 0.25, fontFamily: 'Roboto');
  static TextStyle get button => TextStyle(fontSize: 14, letterSpacing: 1.25, fontFamily: 'Roboto');
  static TextStyle get caption => TextStyle(fontSize: 12, letterSpacing: 2, fontFamily: 'Roboto');
}

class AppSize {
  static get bezel => RoundedRectangleBorder(borderRadius: bezelGeom);
  static get bezelGeom => BorderRadius.circular(3.0);
}

class AppAssets {
  static get boyoTodoLogo => AssetImage("assets/images/boyo_todo_logo.png");
  static get facebookIcon => AssetImage("assets/images/facebook_icon.png");
}