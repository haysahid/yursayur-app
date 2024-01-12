import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';

class AppTheme {
  AppTheme();

  static AppTheme? _current;

  static AppTheme get current {
    _current ??= AppTheme();
    return _current!;
  }

  static ThemeData? lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.cream1,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
    ),
    useMaterial3: true,
    primaryColor: AppColor.primary,
    fontFamily: 'Poppins',
  );
}
