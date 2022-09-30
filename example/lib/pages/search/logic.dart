import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sprintf/sprintf.dart';
import 'package:wego_mnn/wego_mnn.dart';

import '../../utils/utils.dart';
import '../base/loading_helper.dart';

class SearchLogic extends GetxController with LoadingHelperMixin {
  var logger = Logger();
  int position = 0;
  int mSearchTime = 0;
  String tips = "图片搜索中...";
  String targetImagePath = "";
  List<String> dataList = [];

  @override
  void onInit() {
    super.onInit();
    logger.i("SearchLogic # onInit");
    position = Get.arguments['position'];
  }

  @override
  void onReady() async {
    super.onReady();
    logger.i("SearchLogic # onReady");
    await _setTargetImage(position);
    await _asyncParse();
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("SearchLogic # onClose");
  }

  Future<void> _setTargetImage(int index) async {
    String imageDir = await Utils.getImageDir();
    targetImagePath = imageDir + sprintf("/ukbench%05d.jpg", [index]);
    update();
  }

  Future<void> _asyncParse() async {
    showProgress();
    await _parse();
    closeProgress();
  }

  Future<void> _parse() async {
    Float32List target =
        await WegoMnn.detect(targetImagePath, Utils.isCompress);
    await _search(target);
  }

  Future<void> _search(Float32List target) async {
    int now = DateTime.now().millisecondsSinceEpoch;
    Float32List faiss = await WegoMnn.vectorSearch(target, 10);
    int end = DateTime.now().millisecondsSinceEpoch;
    mSearchTime = end - now;
    logger.i("wegomnn mnn:" + (mSearchTime / 1000).toString() + "秒");

    /// 刷新搜索结果
    List<String> images = [];
    String imageDir = await Utils.getImageDir();
    for (double item in faiss) {
      int index = item.round();
      images.add(imageDir + sprintf("/ukbench%05d.jpg", [index]));
    }

    // 搜索结果列表
    dataList.clear();
    dataList.addAll(images);

    // 搜索结果费时
    tips = "图片搜索费时：" + mSearchTime.toString() + "毫秒";
    update();
  }
}
