import 'package:flutter/material.dart';
import 'package:sy_flutter_alipay/sy_flutter_alipay.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
          child: RaisedButton(
              child: Text('支付'),
              onPressed: () async {
                const payInfo =
                    "app_id=2018072660770413&biz_content=%7B%22subject%22%3A%22%E6%94%AF%E4%BB%98%E6%B5%8B%E8%AF%95%22%2C%22out_trade_no%22%3A%221540903989232481288%22%2C%22total_amount%22%3A%220.01%22%2C%22product_code%22%3A%22FAST_INSTANT_TRADE_PAY%22%2C%22body%22%3A%22%E6%94%AF%E4%BB%98%E6%B5%8B%E8%AF%95%22%7D&charset=utf-8&format=JSON&method=alipay.trade.app.pay&notify_url=https%3A%2F%2Fwww.baidu.com&sign=SC7iqaLi0%2B3XlS%2BYsgU5chQeMUtzDh1RTG%2Fjc1qN3t%2BvaYyrgSXaNMGbpBk6WfhhiKlz2g8FKXkeKdxf9bUOtUKknLNMxs7BDxf%2BBzXTcROzWjrLuKiQCZ%2B5UC5FxyEez7Vt%2FddTYwJNW%2F4mq8wq6yM4iQCFxrBR4Bw%2BzAnCifLveNAc58KdadFYTcE8RLLmGornyP2C6uXjJlMxBfx1mSpf%2ByrVFPAo24cjJDMLEWOxU1RnwTmrPTl1UZuqb0rqYmYzkDLSYXJfgHY8mairLYTla42oaR9vqBxMXIvgtTH%2B6CGbB9KNrvjdLSC74bAIlxeG5kV39k2z0NL4r4WYWQ%3D%3D&sign_type=RSA2&timestamp=2018-10-30+20%3A53%3A09&version=1.0";
                var result = await SyFlutterAlipay.pay(payInfo,
                    urlScheme: 'cn.isanye.alipay');
                print(result);
              }),
        ),
      ),
    );
  }
}
