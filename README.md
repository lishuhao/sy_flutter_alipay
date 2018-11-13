# sy_flutter_alipay

flutter 支付宝插件

## 安装

首先在pubspec.ymal 添加依赖

### iOS

添加urlScheme

![添加urlScheme](https://t.alipayobjects.com/images/rmsweb/T1lThhXj4cXXXXXXXX.png)

[参考支付宝文档](https://docs.open.alipay.com/204/105295/)

### Android

无需配置

## 示例

``` dart
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
          title: const Text('sy_flutter_alipay example'),
        ),
        body: new Center(
          child: RaisedButton(
              child: Text('支付'),
              onPressed: () async {
                const payInfo ="从服务端获取的支付参数";
                var result = await SyFlutterAlipay.pay(
                    payInfo,
                    urlScheme: '你的ios urlScheme', //前面配置的urlScheme
                    isSandbox: true //是否是沙箱环境，只对android有效
                );
                print(result);
              }),
        ),
      ),
    );
  }
}

```


####
其它Flutter plugin

- [微信](https://github.com/lishuhao/sy_flutter_wechat)
- [Flutter组件库](https://github.com/lishuhao/sy_flutter_widgets)
- [高德定位](https://github.com/lishuhao/sy_flutter_amap)
- [七牛云存储SDK](https://github.com/lishuhao/sy_flutter_qiniu_storage)