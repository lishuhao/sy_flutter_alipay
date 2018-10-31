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
                const payInfo = "从服务端获取的支付参数";
                var result = await SyFlutterAlipay.pay(payInfo,
                    urlScheme: '你的ios urlScheme', isSandbox: true);
                print(result);
              }),
        ),
      ),
    );
  }
}
