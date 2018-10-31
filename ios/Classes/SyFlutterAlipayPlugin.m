#import "SyFlutterAlipayPlugin.h"
#import <AlipaySDK/AlipaySDK.h>

@implementation SyFlutterAlipayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"sy_flutter_alipay"
            binaryMessenger:[registrar messenger]];
  SyFlutterAlipayPlugin* instance = [[SyFlutterAlipayPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"pay" isEqualToString:call.method]) {
      //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
      NSString* urlScheme = [call.arguments objectForKey:@"urlScheme"];
      NSString* payInfo = [call.arguments objectForKey:@"payInfo"];
      if(!urlScheme){
          result(@"");
          NSLog(@"urlScheme 不能为空");
          return;
      }
      // NOTE: 调用支付结果开始支付
      [[AlipaySDK defaultService] payOrder:payInfo fromScheme:urlScheme callback:^(NSDictionary *resultDic) {
          //NSLog(@"reslut = %@",resultDic);
          result(resultDic);
      }];
    //result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
