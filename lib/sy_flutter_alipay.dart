import 'dart:async';

import 'package:flutter/services.dart';

class SyFlutterAlipay {
  static const MethodChannel _channel =
      const MethodChannel('sy_flutter_alipay');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<dynamic> pay(String payInfo,
      {String urlScheme, bool isSandbox = false}) async {
    var result;
    try {
      result = await _channel.invokeMethod('pay', <String, dynamic>{
        'payInfo': payInfo,
        'isSandbox': isSandbox,
        'urlScheme': urlScheme
      });
    } on PlatformException catch (e) {
      print(e);
      return null;
    }
    return result;
  }
}
