package com.gstory.quakerbirdad

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import com.gstory.quakerbirdad.fullscreenad.FullScreenAd
import com.gstory.quakerbirdad.interactionad.InteractionAd
import com.gstory.quakerbirdad.rewardvideoad.RewardVideoAd
import com.youxiao.ssp.core.SSPSdk
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** QuakerbirdadPlugin */
class QuakerbirdadPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private var applicationContext: Context? = null
    private var mActivity: Activity? = null
    private var mFlutterPluginBinding: FlutterPlugin.FlutterPluginBinding? = null

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        mActivity = binding.activity
        //注册view
        QuakerBirdViewPlugin.registerWith(mFlutterPluginBinding!!, mActivity!!)
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "quakerbirdad")
        channel.setMethodCallHandler(this)
        applicationContext = flutterPluginBinding.applicationContext
        mFlutterPluginBinding = flutterPluginBinding
        //注册event
        QuakerBirdAdEvent().onAttachedToEngine(flutterPluginBinding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        mActivity = null
    }

    override fun onDetachedFromActivity() {
        mActivity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        mActivity = binding.activity
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "register") {
            val appId = call.argument<String>("androidAppId")
            val channelId = call.argument<String>("channelId")
            val download = call.argument<Int>("download")
            val permission = call.argument<Boolean>("permission")
            val debug = call.argument<Boolean>("debug")
            //是否开启插件日志
            LogUtil.apply {
                setAppName("QuakerBirdAd")
                setShow(debug!!)
            }
            // 设置下载确认策略 (设置为不确认，默认为DownloadConfirmPolicy.CONFIRM_DEFAULT:非WiFi下提 示确认)
            SSPSdk.setDownloadConfirmPolicy(download!!)
            //设置是否初始化时就申请权限
            SSPSdk.setReqPermission(permission!!)
            //初始化
            SSPSdk.init(applicationContext, appId, channelId, debug!!)
            result.success(true)
        } else if (call.method == "getSDKVersion") {
            result.success(SSPSdk.getSdkVersion())
            //加载全屏广告
        } else if (call.method == "loadInteractionAd") {
            val androidId = call.argument<String>("androidId")
            InteractionAd.init(mActivity!!, androidId)
            //加载全屏广告
        } else if (call.method == "loadFullScreenAd") {
            val androidId = call.argument<String>("androidId")
            FullScreenAd.init(mActivity!!, androidId)
            //加载激励广告
        } else if (call.method == "loadRewardVideoAd") {
            val androidId = call.argument<String>("androidId")
            RewardVideoAd.init(mActivity!!, androidId)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
