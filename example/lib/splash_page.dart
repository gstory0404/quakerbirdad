import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quakerbirdad/quakerbirdad.dart';

/// @Author: gstory
/// @CreateDate: 2023/2/5 14:56
/// @Email gstory0404@gmail.com
/// @Description: 开屏广告
///

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return QuakerBirdAdSplash(
      androidId: "3561",
      iosId: "1331028209814224946",
      width: window.physicalSize.width / window.devicePixelRatio,
      height: window.physicalSize.height / window.devicePixelRatio,
      callBack: QuakerBirdAdSplashCallBack(
        onShow: (){
          print("开屏广告显示");
        },
        onError: (msg){
          print("开屏广告失败 $msg");
        },
        onClick: (){
          print("开屏广告点击");
        },
        onDismiss: (){
          print("开屏广告关闭");
          Navigator.pop(context);
        },
        onStatus: (type,platform,status,msg){
          print("开屏广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
        }
      ),
    );
  }
}
