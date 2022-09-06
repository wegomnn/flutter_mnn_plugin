import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class WegoMnn {
  /// 图片向量的大小
  static const int vectorSize = 1000;

  static const MethodChannel _channel = MethodChannel('wego_mnn');

  /// mnn 初始化
  static void initialization() {
    _channel.invokeMethod('initialization');
  }

  /// 推理模型文件资源申请
  static void create() {
    _channel.invokeMethod('create');
  }

  /// 推理模型文件资源释放
  static void release() {
    _channel.invokeMethod('release');
  }

  /// 图片向量解析
  ///
  /// @param imagePath 图片本地地址
  /// @return 1000纬度的图片向量集合
  static Future<Float32List> detect(String imagePath) async {
    final Float32List vector =
        await _channel.invokeMethod('detect', {'imagePath': imagePath});
    return vector;
  }

  /// 图片向量的批量插入
  ///
  /// @param context    上下文
  /// @param collection 单张或者多张图片向量集合
  /// @return 插入结果 [id, id)
  static Future<Int32List> vectorInsert(Float32List collection) async {
    final Int32List ids =
        await _channel.invokeMethod('vectorInsert', {"collection": collection});
    return ids;
  }

  /// 图片搜索
  ///
  /// @param context 上下文
  /// @param target  单张图片向量集合
  /// @param size    预期搜索返回结果的数量
  /// @return 搜索结果 [id, id)
  static Future<Float32List> vectorSearch(Float32List target, int size) async {
    final Float32List vector = await _channel
        .invokeMethod('vectorSearch', {"target": target, "size": size});
    return vector;
  }

  /// 清空手机本地缓存的全部向量集
  static void vectorClear() {
    _channel.invokeMethod('vectorClear');
  }

  static Future<void> copyAssetDirToFiles(
      String dirname, bool isCacheDir) async {
    await _channel.invokeMethod(
        'copyAssetDirToFiles', {'dirname': dirname, 'isCacheDir': isCacheDir});
  }
}
