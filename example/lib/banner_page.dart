import 'package:flutter/material.dart';
import 'package:quakerbirdad/quakerbirdad.dart';

/// @Author: gstory
/// @CreateDate: 2023/2/5 16:49
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class BannerPage extends StatefulWidget {
  const BannerPage({Key? key}) : super(key: key);

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("横幅广告"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            QuakerBirdAdBanner(
              androidId: "1983",
              iosId: "1330826173118169119",
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
                  },
                  onStatus: (type,platform,status,msg){
                    print("横幅广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
                  }
              ),
            ),
            QuakerBirdAdBanner(
              androidId: "1983",
              iosId: "1330826173118169119",
              width: 500,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
