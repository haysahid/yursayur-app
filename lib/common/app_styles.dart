import 'package:flutter/material.dart';
import 'package:pasar_sayur/common/app_colors.dart';

// Font Weight
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

TextStyle textStyle = TextStyle(fontFamily: 'Poppins', color: AppColor.gray100);

// Text Style
class AppTextStyle {
  static final title1 = textStyle.copyWith(fontSize: 32, fontWeight: bold);
  static final title2 = textStyle.copyWith(fontSize: 24, fontWeight: bold);
  static final subtitle1 = textStyle.copyWith(fontSize: 20, fontWeight: medium);
  static final subtitle2 = textStyle.copyWith(fontSize: 18, fontWeight: medium);
  static final body1 = textStyle.copyWith(fontSize: 16, fontWeight: medium);
  static final body2 = textStyle.copyWith(fontSize: 14);
  static final body3 = textStyle.copyWith(fontSize: 13);
  static final caption = textStyle.copyWith(fontSize: 12);
  static final overline = textStyle.copyWith(fontSize: 11);
}

// Text Themes
// TextTheme textTheme = TextTheme(
//   titleLarge: title1TextStyle,
//   titleMedium: title2TextStyle,
//   titleSmall: subtitle1TextStyle,
//   bodyLarge: body1TextStyle,
//   bodyMedium: body2TextStyle,
//   bodySmall: body3TextStyle,
//   labelLarge: captionTextStyle,
//   labelMedium: overlineTextStyle,
// );
