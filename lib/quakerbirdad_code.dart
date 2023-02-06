
/// @Author: gstory
/// @CreateDate: 2023/2/3 18:29
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述
///

class QuakerBirdAdType {
  static const String adType = "adType";

  ///插屏广告
  static const String interaction = "interactionAd";

  ///激励广告
  static const String rewardAd = "rewardAd";

  ///全屏视频广告
  static const String fullScreenAd = "fullScreenAd";
}

class QuakerBirdAdMethod {
  ///stream中 广告方法
  static const String onAdMethod = "onAdMethod";

  ///显示view
  static const String onShow = "onShow";

  ///加载失败
  static const String onError = "onError";

  ///点击
  static const String onClick = "onClick";

  ///广告关闭
  static const String onDismiss = "onDismiss";

  ///广告状态
  static const String onStatus = "onStatus";


  ///奖励
  static const String onReward = "onReward";
}

class QuakerBirdAdDownload {
  ///非WiFi下提 示确认
  static const int ALWAYS = 1;

  ///默认
  static const int DEFAULT = 2;

  ///不确认
  static const int NONE = 3;
}
