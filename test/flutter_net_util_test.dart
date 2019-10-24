import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_net_util/flutter_net_util.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_net_util');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterNetUtil.platformVersion, '42');
  });
}
