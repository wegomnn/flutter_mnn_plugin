import 'package:flutter/material.dart';

import 'theme.dart';

class SyStyle {
  /// 水平间隔
  static const Widget hGap5 = SizedBox(width: SyDimen.SIZE_5);
  static const Widget hGap10 = SizedBox(width: SyDimen.SIZE_10);
  static const Widget hGap15 = SizedBox(width: SyDimen.SIZE_15);
  static const Widget hGap30 = SizedBox(width: SyDimen.SIZE_30);
  static const Widget hGap50 = SizedBox(width: SyDimen.SIZE_50);

  /// 垂直间隔
  static const Widget vGap5 = SizedBox(height: SyDimen.SIZE_5);
  static const Widget vGap8 = SizedBox(height: SyDimen.SIZE_8);
  static const Widget vGap10 = SizedBox(height: SyDimen.SIZE_10);
  static const Widget vGap15 = SizedBox(height: SyDimen.SIZE_15);
  static const Widget vGap20 = SizedBox(height: SyDimen.SIZE_20);
  static const Widget vGap30 = SizedBox(height: SyDimen.SIZE_30);
  static const Widget vGap50 = SizedBox(height: SyDimen.SIZE_50);

  /// 水平分割线
  static const Widget line = Divider();

  /// 竖直分割线
  static const Widget vLine = SizedBox(
    width: 0.6,
    height: 24.0,
    child: VerticalDivider(),
  );

  /// 空白占位图
  static const Widget empty = SizedBox.shrink();

  /// 列表 separator 占位图
  static const Widget separator = Divider(
    height: SyDimen.SIZE_12,
    color: SyColor.transparent,
  );

  /// 背景框
  static BoxDecoration boxDecoration = BoxDecoration(
    color: SyColor.white,
    borderRadius: BorderRadius.circular(SyDimen.radius),
  );

  /// 商品详情背景框
  static BoxDecoration boxSubDecoration = BoxDecoration(
    color: SyColor.checkableColor,
    borderRadius: BorderRadius.circular(SyDimen.radius),
  );

  /// 背景框
  static BoxDecoration boxDefaultDecoration = BoxDecoration(
    gradient: const LinearGradient(
      colors: [Color(0xFFFFB052), Color(0xFFE60112)],
      begin: FractionalOffset(1, 0),
      end: FractionalOffset(0, 1),
    ),
    borderRadius: BorderRadius.circular(SyDimen.radius5),
  );

  /// 背景框
  static BoxDecoration boxDecorationBox = BoxDecoration(
    color: SyColor.white,
    borderRadius: BorderRadius.circular(SyDimen.radius5),
    border: Border.all(
      color: SyColor.borderColor,
      width: 1.0,
    ),
  );

  /// 背景框
  @Deprecated("buildCard")
  static BoxDecoration boxDecorationShadow = BoxDecoration(
    color: SyColor.white,
    borderRadius: BorderRadius.circular(SyDimen.radius),
    boxShadow: const [
      BoxShadow(
          color: SyColor.shadowColor,
          offset: Offset(5.0, 5.0), //阴影xy轴偏移量
          blurRadius: 5.0, //阴影模糊程度
          spreadRadius: 0.0 //阴影扩散程度
          ),
    ],
  );

  /// 统一高度的标题
  static PreferredSize syAppBar({
    required String pageTitle,
    Widget? leading,
    PreferredSizeWidget? bottom,
    double appBarHeight = SyDimen.appBarHeight,
    List<Widget>? actions,
  }) {
    return PreferredSize(
      child: AppBar(
        title: Text(
          pageTitle,
          style: SyFont.titleText,
        ),
        leading: leading,
        centerTitle: true,
        elevation: 0,
        bottom: bottom,
        actions: actions,
      ),
      preferredSize: Size.fromHeight(appBarHeight),
    );
  }

  /// input 输入框
  static Card buildCard({EdgeInsetsGeometry? margin, Widget? child}) {
    return Card(
      // 背景色
      color: SyColor.white,
      // 阴影颜色
      shadowColor: SyColor.shadowColor,
      // 边框
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SyDimen.radius),
        side: const BorderSide(
          color: SyColor.borderColor,
          width: 1.0,
        ),
      ),
      // 阴影高度
      elevation: 20.0,
      child: child,
      margin: margin,
    );
  }

  /// 确定按钮
  static Widget buildConfirmButton({
    required String label,
    required VoidCallback? onPressed,
  }) {
    return _buildButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: SyColor.primaryValue,
      textStyle:
          const TextStyle(color: SyColor.white, fontSize: SyFont.FONT_14),
      textColor: SyColor.white,
    );
  }

  /// 取消按钮
  static Widget buildCancelButton({
    required String label,
    required VoidCallback? onPressed,
  }) {
    return _buildButton(
      label: label,
      onPressed: onPressed,
      backgroundColor: SyColor.borderColor,
      // backgroundColor: Color.fromRGBO(0, 0, 0, 0.2),
      textStyle: const TextStyle(fontSize: SyFont.FONT_14),
      textColor: SyColor.color05000000,
    );
  }

  /// 按钮
  static Widget _buildButton({
    required String label,
    required VoidCallback? onPressed,
    required Color backgroundColor,
    required TextStyle textStyle,
    Color? textColor,
  }) {
    return Container(
      width: double.infinity,
      height: SyDimen.btnHeight,
      child: ElevatedButton(
        style: (textColor != null)
            ? ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                textStyle: MaterialStateProperty.all(textStyle),
                foregroundColor: MaterialStateProperty.all(textColor),
              )
            : ButtonStyle(
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                textStyle: MaterialStateProperty.all(textStyle),
              ),
        child: Text(label),
        onPressed: onPressed,
      ),
    );
  }

  /// 按钮
  static Widget buildOutlinedButton({
    required Widget child,
    required VoidCallback? onPressed,
    Color? borderColor,
  }) {
    return SizedBox(
      height: SyDimen.btnHeight30,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SyDimen.radius20),
          ),
          // side: BorderSide(width: 1.0, color: SyColor.primaryValue),
          side:
              BorderSide(width: 1.0, color: borderColor ?? SyColor.borderColor),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }

  /// 输入框
  static Widget buildTextField({
    double? width = double.infinity,
    required Widget child,
  }) {
    return Container(
      // decoration: SyStyle.boxDecoration,
      width: width,
      // height: SyDimen.inputHeight,
      child: child,
    );
  }

  /// 新增菜单
  static Widget buildAddMenu({String? label, VoidCallback? onPressed}) {
    if (label != null) {
      return buildLabelMenu(label: label, onPressed: onPressed);
    } else {
      return buildIconMenu(
          icon: const Icon(SyICon.iconAdd), onPressed: onPressed);
    }
  }

  /// 新增菜单
  static Widget buildLabelMenu(
      {required String label, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: () => onPressed?.call(),
      child: SizedBox(
          width: 60,
          child: Center(
              child: Text(
            label,
            style: SyFont.titleMenuText,
          ))),
    );
  }

  /// 新增菜单
  static Widget buildIconMenu({required Widget icon, VoidCallback? onPressed}) {
    return IconButton(
      // icon: Icon(SyICon.iconAdd),
      icon: icon,
      onPressed: () => onPressed?.call(),
    );
  }
}
