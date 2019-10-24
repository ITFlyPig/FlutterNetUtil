import 'dart:async';

import 'package:flutter/services.dart';

class FlutterNetUtil {
  static const MethodChannel _channel = const MethodChannel('flutter_net_util');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get operatorName async {
    final String operatorName = await _channel.invokeMethod('getOperatorName');
    return operatorName;
  }

  static Future<int> get networkState async {
    final int state = await _channel.invokeMethod('getNetworkState');
    return state;
  }

  ///开始监听网络的信号强度
  static listenPhoneState() {
    _channel.invokeMethod('listenPhoneState');
  }

  ///获取信号的强度
  static Future<int> getSignalStrength() async {
    final int signalStrength = await _channel.invokeMethod('getSignalStrength');
    return signalStrength;
  }
}
