import 'package:fluttertoast/fluttertoast.dart';
import 'package:wego_mnn_example/style/theme.dart';

/// Toast工具类
class ToastUtils {
  static void show({String msg = "建设中，敬请期待...", Toast duration = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: duration,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: SyColor.borderColor,
        textColor: SyColor.textColor,
        fontSize: SyFont.FONT_13);
  }

  static void cancel() {
    Fluttertoast.cancel();
  }
}
