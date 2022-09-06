import 'package:flutter/material.dart';

///颜色
class SyColor {
  static const int primaryIntValue = 0xFFC2462D;

  static const MaterialColor primarySwatch = MaterialColor(
    primaryIntValue,
    <int, Color>{
      50: Color(primaryIntValue),
      100: Color(primaryIntValue),
      200: Color(primaryIntValue),
      300: Color(primaryIntValue),
      400: Color(primaryIntValue),
      500: Color(primaryIntValue),
      600: Color(primaryIntValue),
      700: Color(primaryIntValue),
      800: Color(primaryIntValue),
      900: Color(primaryIntValue),
    },
  );

  static const int primaryIntValueWhite = 0xFFFFFFFF;

  static const MaterialColor primarySwatchWhite = MaterialColor(
    primaryIntValueWhite,
    <int, Color>{
      50: Color(primaryIntValueWhite),
      100: Color(primaryIntValueWhite),
      200: Color(primaryIntValueWhite),
      300: Color(primaryIntValueWhite),
      400: Color(primaryIntValueWhite),
      500: Color(primaryIntValueWhite),
      600: Color(primaryIntValueWhite),
      700: Color(primaryIntValueWhite),
      800: Color(primaryIntValueWhite),
      900: Color(primaryIntValueWhite),
    },
  );

  static const Color primaryValue = Color(0xFFC2462D);
  static const Color primaryLightValue = Color(0xFFC2462D);
  static const Color primaryDarkValue = Color(0xFF121917);

  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textWhite = Color(0xFFFFFFFF);

  static const Color transparent = Color(0x00FFFFFF);

  // static const Color miWhite = Color(0xffF8F8F8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color orange = Color(0xFFFA6400);
  static const Color yellow = Color(0xFFF59524);

  static const Color actionBlue = Color(0xFFC2462D);
  static const Color subTextColor = Color(0xFF959595);

  // static const Color subLightTextColor = Color(0xFFC4C4C4);
  static const Color subLightTextColor = Color(0xFF776E67);

  static const Color backgroundColor = Color(0xffF8F8F8);

  static const Color textColor = black;
  static const Color textColorWhite = white;

  static const Color msgBgColor = Color(0xFFFCF6EF);

  static const Color dividerColor = Color(0x19000000);
  static const Color shadowColor = Color(0x19000000);
  static const Color refresherColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFFDFDEE2);
  static const Color invalidColor = Color(0xFFC2C3C7);
  static const Color placeholderColor = Color(0xFFCCCCCC);

  static const Color checkableColor = Color.fromRGBO(0, 0, 0, .03);
  static const Color checkedColor = Color.fromRGBO(250, 157, 59, .2);

  static const Color color262626 = Color(0xFF262626);
  static const Color color666666 = Color(0xFF666666);
  static const Color colorF0ECEC = Color(0xFFF0ECEC);
  static const Color color01000000 = Color.fromRGBO(0, 0, 0, .1);
  static const Color color05000000 = Color.fromRGBO(0, 0, 0, .5);
}
