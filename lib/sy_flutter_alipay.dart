import 'dart:async';

import 'package:flutter/services.dart';

class SyFlutterAlipay {
  static const MethodChannel _channel =
      const MethodChannel('sy_flutter_alipay');

  ///payInfo 服务端返回的支付请求字符串
  ///urlScheme iOS 支付需要用到，用Xcode打开项目ios部分，点击项目名称，点击“Info”选项卡，
  /// 在“URL Types”选项中，点击“+”，在“URL Schemes”中输你的urlScheme，该参数涉及到支付完成能否正确跳回商户app
  /// isSandbox android支付需要，是否是沙箱环境，默认非沙箱
  ///
  /// 返回结果参考 https://docs.open.alipay.com/204/105301/
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
