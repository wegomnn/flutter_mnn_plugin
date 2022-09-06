import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:wego_mnn/wego_mnn.dart';
import 'package:wego_mnn_example/pages/base/route.dart';
import 'package:wego_mnn_example/pages/home/page.dart';
import 'package:wego_mnn_example/style/theme.dart';

Future<void> main() async {
  /// 确保初始化完成（不加这个强制横/竖屏会报错）
  WidgetsFlutterBinding.ensureInitialized();

  /// 强制竖屏
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  /// mnn 初始化
  WegoMnn.initialization();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '微购搜索',
      theme: ThemeData(
        primarySwatch: SyColor.primarySwatch,
      ),

      /// 路由
      defaultTransition: Transition.cupertino,
      initialRoute: RouteConfig.homePage,
      unknownRoute: RouteConfig.unknownRoute,
      getPages: RouteConfig.pages,
      home: HomePage(title: "微购搜索"),
    );
  }
}
