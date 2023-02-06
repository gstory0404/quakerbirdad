import 'package:flutter/material.dart';
import 'package:quakerbirdad/quakerbirdad.dart';
import 'package:quakerbirdad_example/express_draw_page.dart';

/// @Author: gstory
/// @CreateDate: 2023/2/5 16:49
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("信息流广告"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            QuakerBirdAdFeed(
              androidId: "2351",
              iosId: "2351",
              width: 500,
              height: 200,
              callBack: QuakerBirdAdFeedCallBack(
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
            QuakerBirdAdFeed(
              androidId: "2351",
              iosId: "2351",
              width: 500,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
