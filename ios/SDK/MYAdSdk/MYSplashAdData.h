//
//  MYSplashAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import "MYBaseAdData.h"


typedef NS_ENUM(NSInteger, MYSplashButtonType) {
    MYSplashButtonType_FullScreen  = 1,  // The whole area of splash view will respond to click event
    MYSplashButtonType_DownloadBar = 2   // The area of download bar in splash view will respond to click event
};

NS_ASSUME_NONNULL_BEGIN
@interface MYSplashAdData : MYBaseAdData


/*
 splashDelegate，开屏广告回调协议
*/
@property (nonatomic, weak) id <MYSplashAdDelegate> splashDelegate;

/*
 开屏广告超时时间，默认为3s，当设置时间小于3秒时，使用默认值3秒
*/
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

/*
 是否是V+广告，默认为NO
*/
@property (nonatomic, assign) BOOL isSplashVideoAd;


/*
 bottomView 为开屏广告底部自定义界面
 注意点：
        1：此处属性为weak，需要app自己持有bottomview(不能是临时变量，可以设置为属性)
        2: 需要设置bottomview的宽，高,bottomView.frame.origin.x 和 bottomView.frame.origin.y，具体参考demo
*/
@property (nonatomic, weak,nullable) UIView *bottomView;

/*
    开屏广告点击区域控制
*/
@property (nonatomic, assign) MYSplashButtonType splashButtonType;

@end

NS_ASSUME_NONNULL_END
