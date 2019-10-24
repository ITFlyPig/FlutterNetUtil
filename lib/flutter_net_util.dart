import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_net_util/net_state.dart';

class FlutterNetUtil {
  static const MethodChannel _channel = const MethodChannel('flutter_net_util');

  ///获取平台的版本
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //获取操运营商名称
  static Future<String> get operatorName async {
    final String operatorName = await _channel.invokeMethod('getOperatorName');
    return operatorName;
  }

  ///获取网络的状态
  static Future<NetState> get networkState async {
    final int state = await _channel.invokeMethod('getNetworkState');
    NetState netState;
    switch(state){
      case 0:
        netState = NetState.NETWORK_NONE;
        break;
      case 1:
        netState = NetState.NETWORK_WIFI;
        break;
      case 2:
        netState = NetState.NETWORK_2G;
        break;
      case 3:
        netState = NetState.NETWORK_3G;
        break;
      case 4:
        netState = NetState.NETWORK_4G;
        break;
      case 5:
        netState = NetState.NETWORK_MOBILE;
        break;

    }
    return netState;
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
