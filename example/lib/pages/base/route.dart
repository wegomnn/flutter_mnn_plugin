import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wego_mnn_example/pages/detect/append/page.dart';
import 'package:wego_mnn_example/pages/detect/batch/page.dart';
import 'package:wego_mnn_example/pages/home/page.dart';
import 'package:wego_mnn_example/pages/search/page.dart';
import 'package:wego_mnn_example/pages/unknown/unknown.dart';

/// 全局路由
class RouteConfig {
  /// 主页面
  static const String homePage = "/";
  static const String unknownPage = "/unknownPage";
  static const String batchPage = "/batchPage";
  static const String appendPage = "/appendPage";
  static const String searchPage = "/searchPage";

  static final unknownRoute =
      GetPage(name: unknownPage, page: () => const UnknownPage(title: '未知页面'));

  static final pages = [
    GetPage(name: homePage, page: () => HomePage(title: "微购搜索")),
    GetPage(name: batchPage, page: () => BatchPage(title: '图片批量解析')),
    GetPage(name: appendPage, page: () => AppendPage(title: '图片追加解析')),
    GetPage(name: searchPage, page: () => SearchPage(title: '图片搜索结果')),
  ];
}
