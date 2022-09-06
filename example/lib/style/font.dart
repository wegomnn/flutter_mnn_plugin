import 'package:flutter/material.dart';

import 'color.dart';

///文本样式
class SyFont {
  // static const lagerTextSize = 30.0;
  // static const bigTextSize = 23.0;
  // static const normalTextSize = 18.0;
  // static const middleTextWhiteSize = 16.0;
  // static const smallTextSize = 14.0;
  // static const minTextSize = 12.0;

  static const FONT_10 = 10.0;
  static const FONT_12 = 12.0;
  static const FONT_13 = 13.0;
  static const FONT_14 = 14.0;
  static const FONT_15 = 15.0;
  static const FONT_17 = 17.0;
  static const FONT_19 = 19.0;
  static const FONT_22 = 22.0;

  static const titleText = TextStyle(
    color: SyColor.white,
    fontSize: FONT_14,
  );

  static const titleMenuText = TextStyle(
    color: SyColor.white,
    fontSize: FONT_13,
  );

  static const normalText = TextStyle(
    color: SyColor.textColor,
    fontSize: FONT_13,
  );

  static const tipsText = TextStyle(
    color: SyColor.subTextColor,
    fontSize: FONT_12,
  );

  static const primaryTipsText = TextStyle(
    color: SyColor.primaryValue,
    fontSize: FONT_13,
  );

  static const hintText = TextStyle(
    color: SyColor.subTextColor,
    fontSize: FONT_13,
  );

  static const primaryText = TextStyle(
    color: SyColor.primaryValue,
    fontSize: FONT_13,
  );

  static const confirmText = TextStyle(
    color: SyColor.primaryValue,
    fontSize: SyFont.FONT_14,
    fontWeight: FontWeight.bold,
  );

  static const confirmText2 = TextStyle(
    color: SyColor.white,
    fontSize: SyFont.FONT_14,
  );

  static const cancelText = TextStyle(
    color: SyColor.black,
    fontSize: SyFont.FONT_14,
    fontWeight: FontWeight.bold,
  );

  static const cancelText2 = TextStyle(
    color: SyColor.black,
    fontSize: SyFont.FONT_14,
  );
}
