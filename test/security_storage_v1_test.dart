import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:security_storage_v1/security_storage_v1.dart';

void main() {
  const MethodChannel channel = MethodChannel('security_storage_v1');

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
    expect(await SecurityStorageV1.platformVersion, '42');
  });
}
