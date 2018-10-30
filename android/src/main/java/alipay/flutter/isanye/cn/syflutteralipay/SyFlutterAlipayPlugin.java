package alipay.flutter.isanye.cn.syflutteralipay;

import android.app.Activity;

import com.alipay.sdk.app.EnvUtils;
import com.alipay.sdk.app.PayTask;

import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** SyFlutterAlipayPlugin */
public class SyFlutterAlipayPlugin implements MethodCallHandler {

  private final Activity activity;

  private SyFlutterAlipayPlugin(Registrar registrar){
      this.activity = registrar.activity();
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "sy_flutter_alipay");
    channel.setMethodCallHandler(new SyFlutterAlipayPlugin(registrar));
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    switch (call.method) {
      case "getPlatformVersion":
        result.success("Android " + android.os.Build.VERSION.RELEASE);
        break;
      case "pay":
        String payInfo = call.argument("payInfo");
        boolean isSandbox = call.argument("isSandbox");
        this.alipay( payInfo,isSandbox, result);
        break;
      default:
        result.notImplemented();
        break;
    }
  }

  //调起支付
  public void alipay(final String payInfo,boolean isSandbox, final MethodChannel.Result callback){
    //沙箱环境
    if(isSandbox){
      EnvUtils.setEnv(EnvUtils.EnvEnum.SANDBOX);
    }

    final Activity activity = this.activity;
    Runnable payRunnable = new Runnable() {
      @Override
      public void run() {
        try {
          PayTask alipay = new PayTask(activity);
          Map<String, String> result = alipay.payV2(payInfo, true);

          callback.success(result);
        } catch (Exception e) {
          callback.error("PAY_ERROR",e.getMessage(),null);
        }
      }
    };

    Thread payThread = new Thread(payRunnable);
    payThread.start();
  }
}
