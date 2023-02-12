part of '../quakerbirdad.dart';

/// @Author: gstory
/// @CreateDate: 2023/2/5 14:57
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class QuakerBirdAdSplash extends StatefulWidget {
  final String androidId;
  final String iosId;
  final double width;
  final double height;
  final QuakerBirdAdSplashCallBack? callBack;

  QuakerBirdAdSplash(
      {Key? key,
      required this.androidId,
      required this.iosId,
      required this.width,
      required this.height,
      this.callBack})
      : super(key: key);

  @override
  State<QuakerBirdAdSplash> createState() => _QuakerBirdAdSplashState();
}

class _QuakerBirdAdSplashState extends State<QuakerBirdAdSplash> {
  String _viewType = "com.gstory.quakerbirdad/SplashAdView";

  MethodChannel? _channel;

  //广告是否显示
  bool _isShowAd = true;

  //宽高
  double _width = 0;
  double _height = 0;

  @override
  void initState() {
    super.initState();
    _isShowAd = true;
    _width = widget.width;
    _height = widget.height;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isShowAd) {
      return Container();
    }
    if (defaultTargetPlatform == TargetPlatform.android) {
      return Container(
        width: _width,
        height: _height,
        child: AndroidView(
          viewType: _viewType,
          creationParams: {
            "androidId": widget.androidId,
            "width": widget.width,
            "height": widget.height,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Container(
        width: _width,
        height: _height,
        child: UiKitView(
          viewType: _viewType,
          creationParams: {
            "iosId": widget.iosId,
            "width": widget.width,
            "height": widget.height,
          },
          onPlatformViewCreated: _registerChannel,
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else {
      return Container();
    }
  }

  //注册cannel
  void _registerChannel(int id) {
    _channel = MethodChannel("${_viewType}_$id");
    _channel?.setMethodCallHandler(_platformCallHandler);
  }

  //监听原生view传值
  Future<dynamic> _platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case QuakerBirdAdMethod.onShow:
        Map map = call.arguments;
        if (mounted) {
          setState(() {
            _isShowAd = true;
            _width = map["width"];
            _height = map["height"];
            print("$_width == $_height");
          });
          if (widget.callBack?.onShow != null) {
            widget.callBack?.onShow!();
          }
        }
        break;
      case QuakerBirdAdMethod.onError:
        if (widget.callBack?.onError != null) {
          Map map = call.arguments;
          widget.callBack?.onError!(map["msg"]);
        }
        break;
      case QuakerBirdAdMethod.onClick:
        if (widget.callBack?.onClick != null) {
          widget.callBack?.onClick!();
        }
        break;
      case QuakerBirdAdMethod.onDismiss:
        if (mounted) {
          setState(() {
            _isShowAd = false;
          });
        }
        if (widget.callBack?.onDismiss != null) {
          widget.callBack?.onDismiss!();
        }
        break;
      case QuakerBirdAdMethod.onStatus:
        if (widget.callBack?.onStatus != null) {
          Map map = call.arguments;
          widget.callBack?.onStatus!(
              map["type"], map["platform"], map["status"], map["msg"]);
        }
        break;
    }
  }
}
