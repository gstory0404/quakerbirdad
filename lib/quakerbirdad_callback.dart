/// @Author: gstory
/// @CreateDate: 2023/2/5 15:55
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述
///

///显示
typedef OnShow = void Function();

///失败
typedef OnError = void Function(dynamic message);

///点击
typedef OnClick = void Function();

///关闭
typedef OnDismiss = void Function();

///奖励
typedef OnReward = void Function(int? type);

///状态
/// type 类型
/// platform 平台
/// status 状态
/// msg 错误消息 (失败时有效)
typedef OnStatus = void Function(
    int? type, int? platform, int? status, String? msg);

/// 开屏广告回调
class QuakerBirdAdSplashCallBack {
  OnShow? onShow;
  OnError? onError;
  OnClick? onClick;
  OnDismiss? onDismiss;
  OnStatus? onStatus;

  QuakerBirdAdSplashCallBack(
      {this.onShow, this.onError, this.onClick, this.onDismiss, this.onStatus});
}

/// 插屏广告回调
class QuakerBirdAdInteractionCallBack {
  OnShow? onShow;
  OnError? onError;
  OnClick? onClick;
  OnDismiss? onDismiss;
  OnStatus? onStatus;

  QuakerBirdAdInteractionCallBack(
      {this.onShow, this.onError, this.onClick, this.onDismiss, this.onStatus});
}

/// 横幅广告回调
class QuakerBirdAdBannerCallBack {
  OnShow? onShow;
  OnError? onError;
  OnClick? onClick;
  OnDismiss? onDismiss;
  OnStatus? onStatus;

  QuakerBirdAdBannerCallBack(
      {this.onShow, this.onError, this.onClick, this.onDismiss, this.onStatus});
}

/// 模版广告回调
class QuakerBirdAdExpressCallBack {
  OnShow? onShow;
  OnError? onError;
  OnClick? onClick;
  OnDismiss? onDismiss;
  OnStatus? onStatus;

  QuakerBirdAdExpressCallBack(
      {this.onShow, this.onError, this.onClick, this.onDismiss, this.onStatus});
}


/// 模版视频广告回调
class QuakerBirdAdExpressDrawCallBack {
  OnShow? onShow;
  OnError? onError;
  OnClick? onClick;
  OnDismiss? onDismiss;
  OnStatus? onStatus;

  QuakerBirdAdExpressDrawCallBack(
      {this.onShow, this.onError, this.onClick, this.onDismiss, this.onStatus});
}


/// 全屏广告回调
class QuakerBirdAdFullScreenCallBack {
  OnShow? onShow;
  OnError? onError;
  OnClick? onClick;
  OnDismiss? onDismiss;
  OnStatus? onStatus;

  QuakerBirdAdFullScreenCallBack(
      {this.onShow, this.onError, this.onClick, this.onDismiss, this.onStatus});
}


/// 信息流广告回调
class QuakerBirdAdNativeCallBack {
  OnShow? onShow;
  OnError? onError;
  OnClick? onClick;
  OnDismiss? onDismiss;
  OnStatus? onStatus;

  QuakerBirdAdNativeCallBack(
      {this.onShow, this.onError, this.onClick, this.onDismiss, this.onStatus});
}

/// 激励广告回调
class QuakerBirdAdRewardCallBack {
  OnShow? onShow;
  OnError? onError;
  OnClick? onClick;
  OnDismiss? onDismiss;
  OnStatus? onStatus;
  OnReward? onReward;

  QuakerBirdAdRewardCallBack(
      {this.onShow, this.onError, this.onClick, this.onDismiss, this.onStatus,this.onReward});
}


