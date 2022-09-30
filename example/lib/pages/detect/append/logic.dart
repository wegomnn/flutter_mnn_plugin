import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sprintf/sprintf.dart';
import 'package:wego_mnn/wego_mnn.dart';
import 'package:wego_mnn_example/pages/base/loading_helper.dart';

import '../../../utils/utils.dart';
import '../../base/route.dart';

class AppendLogic extends GetxController with LoadingHelperMixin {
  var logger = Logger();
  int imageSize = 100;
  int mIndex = 0;
  String appendTips = "点击追加100张图片";
  String tips = "请点击目标图片，会直接触发搜索功能";
  int mParseTime = 0;
  int mSaveTime = 0;
  List<String> dataList = [];
  List<String> _imagePaths = [];

  @override
  void onInit() {
    super.onInit();
    logger.i("BatchLogic # onInit");
  }

  @override
  void onReady() async {
    super.onReady();
    logger.i("BatchLogic # onReady");

    /// 清空之前的图片向量
    WegoMnn.vectorClear();

    /// mnn 资源申请
    WegoMnn.create();
  }

  @override
  void onClose() {
    super.onClose();
    logger.i("BatchLogic # onClose");

    /// mnn 资源释放
    WegoMnn.release();
  }

  Future<void> onTapAppendImages() async {
    String imageDir = await Utils.getImageDir();

    List<String> paths = [];
    for (int i = mIndex * imageSize; i < (mIndex + 1) * imageSize; i++) {
      paths.add(imageDir + sprintf("/ukbench%05d.jpg", [i]));
    }

    _imagePaths.clear();
    _imagePaths.addAll(paths);

    dataList.addAll(paths);

    appendTips = "点击追加100张图片/当前" + dataList.length.toString() + "张图片";
    update();
    mIndex++;

    await _asyncParse();
  }

  Future<void> _asyncParse() async {
    showProgress();
    await _parse();
    closeProgress();
    _resultView();
  }

  Future<void> _parse() async {
    int size = WegoMnn.vectorSize;
    int nb = imageSize;

    Float32List collection =
        Float32List(size * nb); // List.generate(size * nb, (index) => 0.0);

    int now = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < nb; i++) {
      logger.i("_parse = " + i.toString() + " = " + _imagePaths[i]);
      Float32List array =
          await WegoMnn.detect(_imagePaths[i], Utils.isCompress);
      for (int j = 0; j < array.length; j++) {
        collection[i * size + j] = array[j];
      }
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    mParseTime = end - now;
    logger.i("wegomnn mnn:" + (mParseTime / 1000).toString() + "秒");

    /// 每次新追加图片向量
    Int32List ids = await WegoMnn.vectorInsert(collection);
    if (ids.isNotEmpty) {
      logger.i("wegomnn ids:" + ids[0].toString() + " - " + ids[1].toString());
    }

    int end2 = DateTime.now().millisecondsSinceEpoch;
    mSaveTime = end2 - end;
    logger.i("wegomnn mnn:" + (mSaveTime / 1000).toString() + "秒");
  }

  void _resultView() {
    // 时间结果
    tips = "图片解析费时：" +
        (mParseTime / 1000).toString() +
        "秒，" +
        "向量保存费时：" +
        mSaveTime.toString() +
        "毫秒";
    tips += "\n";
    tips += "请点击目标图片，会直接触发搜索功能";
    update();
  }

  /// grid widget
  void onItemTap(int position) {
    int size = dataList.length;
    Get.toNamed(RouteConfig.searchPage,
        arguments: {"position": position, "size": size});
  }
}
