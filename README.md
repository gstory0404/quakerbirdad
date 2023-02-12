# Flutter信天翁广告插件

<p>
<a href="https://pub.flutter-io.cn/packages/quakerbirdad"><img src=https://img.shields.io/pub/v/quakerbirdad?color=orange></a>
<a href="https://pub.flutter-io.cn/packages/quakerbirdad"><img src=https://img.shields.io/pub/likes/quakerbirdad></a>
<a href="https://pub.flutter-io.cn/packages/quakerbirdad"><img src=https://img.shields.io/pub/points/quakerbirdad></a>
<a href="https://github.com/gstory0404/quakerbirdad/commits"><img src=https://img.shields.io/github/last-commit/gstory0404/quakerbirdad></a>
<a href="https://github.com/gstory0404/quakerbirdad"><img src=https://img.shields.io/github/stars/gstory0404/quakerbirdad></a>
</p>

## 官方文档
* [Android](https://github.com/gstory0404/quakerbirdad/blob/master/doc/android.pdf)
* [IOS](https://github.com/gstory0404/quakerbirdad/blob/master/doc/ios.pages)

## 版本更新

[更新日志](https://github.com/gstory0404/quakerbirdad/blob/master/CHANGELOG.md)

## 本地开发环境
```
[✓] Flutter (Channel stable, 3.7.0, on macOS 13.1 22C65 darwin-x64, locale zh-Hans-CN)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.1)
[✓] Xcode - develop for iOS and macOS (Xcode 14.2)
[✓] Chrome - develop for the web
[✓] Android Studio
[✓] Android Studio (version 2022.1)
[✓] IntelliJ IDEA Ultimate Edition (version 2022.3.2)
[✓] VS Code (version 1.74.3)
[✓] Connected device (3 available)
[✓] HTTP Host Availability
```

## 集成步骤
### 1、pubspec.yaml

```Dart
quakerbirdad: ^0.0.5
```

引入
```Dart
import 'package:quakerbirdad/quakerbirdad.dart';
```

### 2、Android
根据[官方文件](https://github.com/gstory0404/quakerbirdad/blob/master/doc/android.pdf)进行权限等配置。

### 3、IOS
根据[官方文件](https://github.com/gstory0404/quakerbirdad/blob/master/doc/ios.pages)进行权限等配置。

### 注意事项

- 广告view传入的宽高仅加载时起效，加载完成后动态修改成SDK返回广告大小


## 使用

### SDK初始化
```dart
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
    );
```

### 获取SDK版本
```dart
await QuakerBirdAd.getSDKVersion();
```

### 获取权限
目前仅iOS生效，用于ATT权限获取
```dart
QuakerBirdAd.requestPermission().then((value) => {
   print("获取权限结果 $value")
});
```

### 开屏广告
```dart
QuakerBirdAdSplash(
      androidId: "3561",
      iosId: "3561",
      width: window.physicalSize.width / window.devicePixelRatio,
      height: window.physicalSize.height / window.devicePixelRatio,
      callBack: QuakerBirdAdSplashCallBack(
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
    );
```

### 横幅广告
```dart
QuakerBirdAdBanner(
              androidId: "1983",
              iosId: "1983", 
              width: 500,
              height: 50,
              callBack: QuakerBirdAdBannerCallBack(
                  onShow: (){
                    print("横幅广告显示");
                  },
                  onError: (msg){
                    print("横幅广告失败 $msg");
                  },
                  onClick: (){
                    print("横幅广告点击");
                  },
                  onDismiss: (){
                    print("横幅广告关闭");
                    Navigator.pop(context);
                  },
                  onStatus: (type,platform,status,msg){
                    print("横幅广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
                  }
              ),
            );
```

### 信息流广告
```dart
QuakerBirdAdNative(
              androidId: "2351",
              iosId: "2351",
              width: 500,
              height: 200,
              callBack: QuakerBirdAdNativeCallBack(
                  onShow: (){
                    print("信息流广告显示");
                  },
                  onError: (msg){
                    print("信息流广告失败 $msg");
                  },
                  onClick: (){
                    print("信息流广告点击");
                  },
                  onDismiss: (){
                    print("信息流广告关闭");
                    Navigator.pop(context);
                  },
                  onStatus: (type,platform,status,msg){
                    print("信息流广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
                  }
              ),
            ),
```

### 模版广告
```dart
QuakerBirdAdExpress(
              androidId: "8461",
              iosId: "8461",
              width: 500,
              height: 300,
              callBack: QuakerBirdAdExpressCallBack(
                  onShow: (){
                    print("模版广告显示");
                  },
                  onError: (msg){
                    print("模版广告失败 $msg");
                  },
                  onClick: (){
                    print("模版广告点击");
                  },
                  onDismiss: (){
                    print("模版广告关闭");
                    Navigator.pop(context);
                  },
                  onStatus: (type,platform,status,msg){
                    print("模版广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
                  }
              ),
            ),
```

### 模版视频广告
```dart
QuakerBirdAdExpressDraw(
              androidId: "8517",
              iosId: "8517",
              width: 500,
              height: 300,
              callBack: QuakerBirdAdExpressDrawCallBack(
                  onShow: (){
                    print("模版视频广告显示");
                  },
                  onError: (msg){
                    print("模版视频广告失败 $msg");
                  },
                  onClick: (){
                    print("模版视频广告点击");
                  },
                  onDismiss: (){
                    print("模版视频广告关闭");
                    Navigator.pop(context);
                  },
                  onStatus: (type,platform,status,msg){
                    print("模版视频广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
                  }
              ),
            ),
```

### 插屏广告
请求广告
```dart
QuakerBirdAd.loadInteractionAd(androidId: "11087", iosId: "11087");
```
监听结果
```dart
FlutterUnionadStream.initAdStream(
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
```


### 全屏广告
请求广告
```dart
 QuakerBirdAd.loadFullScreenAd(androidId: "8811", iosId: "8811");
```
监听结果
```dart
FlutterUnionadStream.initAdStream(
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
);
```

### 激励广告
请求广告
```dart
 QuakerBirdAd.loadRewardVideoAd(androidId: "1028", iosId: "1028");
```
监听结果
```dart
FlutterUnionadStream.initAdStream(
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
```