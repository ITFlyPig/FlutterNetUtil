import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_net_util/flutter_net_util.dart';
import 'package:flutter_net_util/net_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int _signalStrength = 0;

  @override
  void initState() {
    super.initState();
    FlutterNetUtil.listenPhoneState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      NetState state = await FlutterNetUtil.networkState;
      platformVersion = state?.toString();
      _signalStrength = await FlutterNetUtil.getSignalStrength();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: GestureDetector(
          onTap: (){
            initPlatformState();
          },
          child: Center(
            child: Text('Running on: $_platformVersion\n' + '信号强度为：$_signalStrength\n'),
          ),
        ),
      ),
    );
  }
}
