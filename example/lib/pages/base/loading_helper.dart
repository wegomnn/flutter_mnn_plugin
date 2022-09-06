import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../widget/progress_dialog.dart';

/// 加载弹窗
mixin LoadingHelperMixin {
  void closeProgress({BuildContext? context}) {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  void showProgress({BuildContext? context}) {
    /// 避免重复弹出
    if (!(Get.isDialogOpen ?? false)) {
      Get.dialog(
        buildProgress(),
        barrierDismissible: false,
        barrierColor:
            const Color(0x00FFFFFF), // 默认dialog背景色为半透明黑色，这里修改为透明（1.20添加属性）
      );
    }
  }

  /// 可自定义Progress
  Widget buildProgress() => const ProgressDialog(hintText: '加载中...');
}
