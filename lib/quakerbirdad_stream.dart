import 'dart:async';

import 'package:flutter/services.dart';
import 'package:quakerbirdad/quakerbirdad.dart';

/// @Author: gstory
/// @CreateDate: 2023/2/5 16:28
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

const EventChannel adEventEvent =
    EventChannel("com.gstory.quakerbirdad/adevent");

class FlutterUnionadStream {
  ///注册stream监听原生返回的信息
  static StreamSubscription initAdStream({
    QuakerBirdAdInteractionCallBack? interactionCallBack,
    QuakerBirdAdFullScreenCallBack? fullScreenCallBack,
    QuakerBirdAdRewardCallBack? rewardCallBack,
  }) {
    StreamSubscription _adStream =
        adEventEvent.receiveBroadcastStream().listen((data) {
      switch (data[QuakerBirdAdType.adType]) {
        //插屏广告
        case QuakerBirdAdType.interaction:
          switch (data[QuakerBirdAdMethod.onAdMethod]) {
            case QuakerBirdAdMethod.onShow:
              if (interactionCallBack?.onShow != null) {
                interactionCallBack?.onShow!();
              }
              break;
            case QuakerBirdAdMethod.onError:
              if (interactionCallBack?.onError != null) {
                interactionCallBack?.onError!(data["msg"]);
              }
              break;
            case QuakerBirdAdMethod.onClick:
              if (interactionCallBack?.onClick != null) {
                interactionCallBack?.onClick!();
              }
              break;
            case QuakerBirdAdMethod.onDismiss:
              if (interactionCallBack?.onDismiss != null) {
                interactionCallBack?.onDismiss!();
              }
              break;
            case QuakerBirdAdMethod.onStatus:
              if (interactionCallBack?.onStatus != null) {
                interactionCallBack?.onStatus!(data["type"], data["platform"],
                    data["status"], data["msg"]);
              }
              break;
          }
          break;
        //全屏广告
        case QuakerBirdAdType.fullScreenAd:
          switch (data[QuakerBirdAdMethod.onAdMethod]) {
            case QuakerBirdAdMethod.onShow:
              if (fullScreenCallBack?.onShow != null) {
                fullScreenCallBack?.onShow!();
              }
              break;
            case QuakerBirdAdMethod.onError:
              if (fullScreenCallBack?.onError != null) {
                fullScreenCallBack?.onError!(data["msg"]);
              }
              break;
            case QuakerBirdAdMethod.onClick:
              if (fullScreenCallBack?.onClick != null) {
                fullScreenCallBack?.onClick!();
              }
              break;
            case QuakerBirdAdMethod.onDismiss:
              if (fullScreenCallBack?.onDismiss != null) {
                fullScreenCallBack?.onDismiss!();
              }
              break;
            case QuakerBirdAdMethod.onStatus:
              if (fullScreenCallBack?.onStatus != null) {
                fullScreenCallBack?.onStatus!(data["type"], data["platform"],
                    data["status"], data["msg"]);
              }
              break;
          }
          break;
      //激励广告
        case QuakerBirdAdType.rewardAd:
          switch (data[QuakerBirdAdMethod.onAdMethod]) {
            case QuakerBirdAdMethod.onShow:
              if (rewardCallBack?.onShow != null) {
                rewardCallBack?.onShow!();
              }
              break;
            case QuakerBirdAdMethod.onError:
              if (rewardCallBack?.onError != null) {
                rewardCallBack?.onError!(data["msg"]);
              }
              break;
            case QuakerBirdAdMethod.onClick:
              if (rewardCallBack?.onClick != null) {
                rewardCallBack?.onClick!();
              }
              break;
            case QuakerBirdAdMethod.onDismiss:
              if (rewardCallBack?.onDismiss != null) {
                rewardCallBack?.onDismiss!();
              }
              break;
            case QuakerBirdAdMethod.onStatus:
              if (rewardCallBack?.onStatus != null) {
                rewardCallBack?.onStatus!(data["type"], data["platform"],
                    data["status"], data["msg"]);
              }
              break;
            case QuakerBirdAdMethod.onReward:
              if (rewardCallBack?.onReward != null) {
                rewardCallBack?.onReward!(data["type"]);
              }
              break;
          }
          break;
      }
    });
    return _adStream;
  }

  static void deleteAdStream(StreamSubscription? stream) {
    stream?.cancel();
  }
}
