import 'package:flutter/material.dart';
import 'package:quakerbirdad/quakerbirdad.dart';

/// @Author: gstory
/// @CreateDate: 2023/2/5 16:49
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class ExpressDrawPage extends StatefulWidget {
  const ExpressDrawPage({Key? key}) : super(key: key);

  @override
  State<ExpressDrawPage> createState() => _ExpressPageState();
}

class _ExpressPageState extends State<ExpressDrawPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("模版视频广告"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            QuakerBirdAdExpressDraw(
              androidId: "8517",
              iosId: "1330870617007734865",
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
                  },
                  onStatus: (type,platform,status,msg){
                    print("模版视频广告状态 类型:$type  平台：$platform  状态：$status  错误消息 (失败时有效):$msg");
                  }
              ),
            ),
            QuakerBirdAdExpressDraw(
              androidId: "8517",
              iosId: "1330870617007734865",
              width: 500,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
