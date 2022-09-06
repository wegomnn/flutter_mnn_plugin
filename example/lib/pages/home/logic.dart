import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:wego_mnn/wego_mnn.dart';
import 'package:wego_mnn_example/pages/base/loading_helper.dart';

import '../../config/constant.dart';
import '../../utils/toast_utils.dart';
import '../../utils/utils.dart';
import '../base/route.dart';

class HomeLogic extends GetxController with LoadingHelperMixin {
  var logger = Logger();
  String unzipLabel = "点击解压 ukbench 图片包";

  @override
  void onReady() async {
    super.onReady();
    logger.i("MainLogic # onReady");
    bool exists = await _exists();
    if (exists) {
      updateUnzipLabel("图片包已解压");
    }
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("MainLogic # onClose");
  }

  void updateUnzipLabel(String label) {
    unzipLabel = label;
    update();
  }

  Future<bool> _exists() async {
    String filesDir = await Utils.getImageDir();
    logger.i("getFilesDir = " + filesDir);

    Directory dir = Directory(filesDir);
    var exist = await dir.exists();
    logger.i("文件夹" + (exist ? "存在" : "不存在"));
    return exist;
  }

  Future<void> gotoBatchPage() async {
    bool exists = await _exists();
    if (exists) {
      Get.toNamed(RouteConfig.batchPage);
    } else {
      ToastUtils.show(msg: "请先解压图片包");
    }
  }

  Future<void> gotoAppendPage() async {
    bool exists = await _exists();
    if (exists) {
      Get.toNamed(RouteConfig.appendPage);
    } else {
      ToastUtils.show(msg: "请先解压图片包");
    }
  }

  Future<void> unzipImage() async {
    bool exists = await _exists();
    if (exists) {
      updateUnzipLabel("图片包已解压");
      ToastUtils.show(msg: "图片包已解压");
    } else {
      showProgress();
      await _preImage();
      closeProgress();
    }
  }

  Future<void> _preImage() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      await WegoMnn.copyAssetDirToFiles(SyConstant.thumbnails, true);
      updateUnzipLabel("图片包已解压");
    } on PlatformException {
      updateUnzipLabel("图片包解压失败");
    }
  }
}
