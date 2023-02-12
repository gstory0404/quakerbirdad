export 'package:quakerbirdad/quakerbirdad_code.dart';
export 'package:quakerbirdad/quakerbirdad_callback.dart';
export 'package:quakerbirdad/quakerbirdad_stream.dart';

import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'quakerbirdad_callback.dart';
import 'quakerbirdad_code.dart';

part 'widget/splash_widget.dart';
part 'widget/banner_widget.dart';
part 'widget/express_widget.dart';
part 'widget/express_draw_widget.dart';
part 'widget/native_widget.dart';

class QuakerBirdAd {
  static const MethodChannel _channel = MethodChannel('quakerbirdad');

  /// # 信天翁SDK初始化
  ///
  /// [androidAppId] android app id
  ///
  /// [iosAppId] ios app id
  ///
  /// [channelId] 应用渠道id (非必填，填写后可以按渠道查看广告数据)
  ///
  /// [download] 是否非WiFi下提示确认 [QuakerBirdAdDownload]
  ///
  /// [permission] 设置是否初始化时就申请权限
  ///
  /// [debug]  是否显示日志，建议正式上线时，设置为false
  static Future<bool> register({
    required String androidAppId,
    required String iosAppId,
    String? channelId,
    int? download,
    bool? permission,
    bool? debug,
  }) async {
    return await _channel.invokeMethod("register", {
      "androidAppId": androidAppId,
      "iosAppId": iosAppId,
      "channelId": channelId,
      "download": download ?? QuakerBirdAdDownload.DEFAULT,
      "permission": permission ?? false,
      "debug": debug ?? false,
    });
  }

  /// # 获取SDK版本号
  static Future<String> getSDKVersion() async {
    return await _channel.invokeMethod("getSDKVersion");
  }

  /// # 获取SDK版本号
  static Future<int> requestPermission() async {
    return await _channel.invokeMethod("requestPermission");
  }

  /// # 加载插屏广告
  ///
  /// [androidId] android 广告位id
  ///
  ///  [iosId] iosId 广告位id
  static Future<bool> loadInteractionAd({
    required String androidId,
    required String iosId,
  }) async {
    return await _channel.invokeMethod("loadInteractionAd", {
      "androidId": androidId,
      "iosId": iosId,
    });
  }

  /// # 加载全屏广告
  ///
  /// [androidId] android 广告位id
  ///
  ///  [iosId] iosId 广告位id
  static Future<bool> loadFullScreenAd({
    required String androidId,
    required String iosId,
  }) async {
    return await _channel.invokeMethod("loadFullScreenAd", {
      "androidId": androidId,
      "iosId": iosId,
    });
  }

  /// # 加载激励广告
  ///
  /// [androidId] android 广告位id
  ///
  ///  [iosId] iosId 广告位id
  static Future<bool> loadRewardVideoAd({
    required String androidId,
    required String iosId,
  }) async {
    return await _channel.invokeMethod("loadRewardVideoAd", {
      "androidId": androidId,
      "iosId": iosId,
    });
  }
}
