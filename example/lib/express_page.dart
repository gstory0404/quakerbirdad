import 'package:flutter/material.dart';
import 'package:quakerbirdad/quakerbirdad.dart';
import 'package:quakerbirdad_example/express_draw_page.dart';

/// @Author: gstory
/// @CreateDate: 2023/2/5 16:49
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class ExpressPage extends StatefulWidget {
  const ExpressPage({Key? key}) : super(key: key);

  @override
  State<ExpressPage> createState() => _ExpressPageState();
}

class _ExpressPageState extends State<ExpressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("模版广告"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
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
            QuakerBirdAdExpress(
              androidId: "8461",
              iosId: "8461",
              width: 500,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
