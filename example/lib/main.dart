import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:quakerbirdad/quakerbirdad.dart';
import 'package:quakerbirdad_example/banner_page.dart';
import 'package:quakerbirdad_example/express_page.dart';
import 'package:quakerbirdad_example/splash_page.dart';

import 'express_draw_page.dart';
import 'feed_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool? _init;
  String? _version = "";
  StreamSubscription? _adViewStream;

  @override
  void initState() {
    super.initState();
    _initRegister();
    _adViewStream = FlutterUnionadStream.initAdStream(
      interactionCallBack: QuakerBirdAdInteractionCallBack(
        onShow: () {
          print("插屏广告显示");
        },
        onError: (msg) {
          print("插屏广告失败 $msg");
        },
        onClick: () {
          print("插屏广告点击");
        },
        onDismiss: () {
          print("插屏广告关闭");
        },
        onStatus: (type, platform, status, msg) {
          print("插屏广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
        },
      ),
      fullScreenCallBack: QuakerBirdAdFullScreenCallBack(
        onShow: () {
          print("全屏广告显示");
        },
        onError: (msg) {
          print("全屏广告失败 $msg");
        },
        onClick: () {
          print("全屏广告点击");
        },
        onDismiss: () {
          print("全屏广告关闭");
        },
        onStatus: (type, platform, status, msg) {
          print("全屏广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
        },
      ),
      rewardCallBack: QuakerBirdAdRewardCallBack(
        onShow: () {
          print("激励广告显示");
        },
        onError: (msg) {
          print("激励广告失败 $msg");
        },
        onClick: () {
          print("激励广告点击");
        },
        onDismiss: () {
          print("激励广告关闭");
        },
        onStatus: (type, platform, status, msg) {
          print("激励广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
        },
        onReward: (type) {
          print("激励广告奖励 $type");
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    FlutterUnionadStream.deleteAdStream(_adViewStream);
  }

  //注册
  void _initRegister() async {
    QuakerBirdAd.register(
      //android  app id
      androidAppId: "881",
      //ios app id
      iosAppId: "881",
      //是否显示日志，建议正式上线时，设置为false
      debug: true,
      //是否非WiFi下提示确认
      download: QuakerBirdAdDownload.ALWAYS,
      //应用渠道id (非必填，填写后可以按渠道查看广告数据)
      channelId: "test",
      //设置是否初始化时就申请权限
      permission: true,
    ).then((value) {
      setState(() {
        _init = value;
      });
    });
    QuakerBirdAd.getSDKVersion().then((value) {
      setState(() {
        _version = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterUnionad example app'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              child: Text("信天翁初始化>>>>>> ${_init ?? _init! ? "成功" : "失败"}"),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              child: Text("信天翁SDK版本号>>>>>> v$_version"),
            ),
            button("开屏广告", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashPage(),
                ),
              );
            }),
            button("插屏广告", () {
              QuakerBirdAd.loadInteractionAd(
                  androidId: "11087", iosId: "11087");
            }),
            button("横幅广告", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BannerPage(),
                ),
              );
            }),
            button("模版广告", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExpressPage(),
                ),
              );
            }),
            button("模版视频广告", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExpressDrawPage(),
                ),
              );
            }),
            button("全屏广告", () {
              QuakerBirdAd.loadFullScreenAd(androidId: "8811", iosId: "8811");
            }),
            button("信息流广告", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeedPage(),
                ),
              );
            }),
            button("激励广告", () {
              QuakerBirdAd.loadRewardVideoAd(androidId: "1028", iosId: "1028");
            }),
          ],
        ),
      ),
    );
  }

  button(String title, VoidCallback call) {
    return MaterialButton(
      color: Colors.blue,
      textColor: Colors.white,
      child: Text(title),
      onPressed: call,
    );
  }
}
