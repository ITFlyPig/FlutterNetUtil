package com.wangyuelin.flutter_net_util;
import android.content.Context;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.PluginRegistry;

public class FlutterNetUtilPlugin implements MethodCallHandler{
    private Context context;


    private FlutterNetUtilPlugin(Context context) {
        this.context = context;
    }

    public static void registerWith(PluginRegistry.Registrar registrar){
        MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_net_util");
        channel.setMethodCallHandler(new FlutterNetUtilPlugin(registrar.activeContext()));
    }


    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("getPlatformVersion") ) {
            result.success("Android ${android.os.Build.VERSION.RELEASE}");
        } else if(methodCall.method.equals("getOperatorName")){
            String operatorName = NetUtils.getOperatorName(context);
            result.success(operatorName);
        }else if(methodCall.method.equals("getNetworkState")){
            int state = NetUtils.getNetworkState(context);
            result.success(state);
        }else if(methodCall.method.equals("listenPhoneState")){
            NetUtils.listenPhoneState(context);
        }else if(methodCall.method.equals("getSignalStrength")){
            int signalStrength = NetUtils.getSignalStrength();
            result.success(signalStrength);
        }else {
            result.notImplemented();
        }

    }
}
