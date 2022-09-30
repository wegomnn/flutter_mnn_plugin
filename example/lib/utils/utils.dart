import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Utils 工具类
class Utils {
  static const bool isCompress = true; // 是否 android 层压缩图片

  static Future<String> getImageDir() async {
    /// getFilesDir getApplicationSupportDirectory
    /// getCacheDir getTemporaryDirectory
    Directory filesDir = await getTemporaryDirectory();
    String path = filesDir.path + "/thumbnails";
    return path;
  }

  static Future<String> getImagePath(String filename) async {
    String filesDir = await getImageDir();
    String path = filesDir + "/" + filename;
    return path;
  }
}
