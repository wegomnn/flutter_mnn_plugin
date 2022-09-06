import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wego_mnn_example/style/theme.dart';

/// Utils 工具类
class Utils {
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
