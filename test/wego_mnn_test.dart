import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wego_mnn/wego_mnn.dart';

void main() {
  const MethodChannel channel = MethodChannel('wego_mnn');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(WegoMnn.initialization, '42');
  });
}
