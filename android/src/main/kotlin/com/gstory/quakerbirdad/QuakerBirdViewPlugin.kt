package com.gstory.quakerbirdad

import android.app.Activity
import com.gstory.quakerbirdad.bannerad.BannerAdViewFactory
import com.gstory.quakerbirdad.expressad.ExpressAdViewFactory
import com.gstory.quakerbirdad.expressad.ExpressDrawAdViewFactory
import com.gstory.quakerbirdad.feedad.FeedAdViewFactory
import com.gstory.quakerbirdad.splashad.SplashAdViewFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin

/**
 * @Author: gstory
 * @CreateDate: 2023/2/5 14:48
 * @Description: java类作用描述
 */

object QuakerBirdViewPlugin {
    fun registerWith(binding: FlutterPlugin.FlutterPluginBinding, activity: Activity) {
        //注册开屏广告
        binding.platformViewRegistry.registerViewFactory(QuakerBirdAdConfig.SplashAdView, SplashAdViewFactory(binding.binaryMessenger, activity))
        //注册banner广告
        binding.platformViewRegistry.registerViewFactory(QuakerBirdAdConfig.BannerAdView, BannerAdViewFactory(binding.binaryMessenger, activity))
        //注册信息流广告
        binding.platformViewRegistry.registerViewFactory(QuakerBirdAdConfig.FeedAdView, FeedAdViewFactory(binding.binaryMessenger, activity))
        //注册模板信息流广告
        binding.platformViewRegistry.registerViewFactory(QuakerBirdAdConfig.ExpressAdView, ExpressAdViewFactory(binding.binaryMessenger, activity))
        //注册模板信息流视频广告
        binding.platformViewRegistry.registerViewFactory(QuakerBirdAdConfig.ExpressDrawAdView, ExpressDrawAdViewFactory(binding.binaryMessenger, activity))
    }
}