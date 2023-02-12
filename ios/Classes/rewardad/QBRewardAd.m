//
//  QBRewardAd.m
//  quakerbirdad
//
//  Created by gstory on 2023/2/9.
//

#import "QBRewardAd.h"
#import "../mysdk/MYRewardVideoAdData.h"
#import "../utils/QBUIViewController+getCurrentVC.h"
#import "../mysdk/MYAdCenter.h"
#import "../event/QBAdEvent.h"

@interface QBRewardAd()<MYRewardVideoAdDelegate>
@property(nonatomic,strong) MYAdCenter *adCenter;
@property(nonatomic,strong) NSString *codeId;
@end

@implementation QBRewardAd
+ (instancetype)sharedInstance{
    static QBRewardAd *myInstance = nil;
    if(myInstance == nil){
        myInstance = [[QBRewardAd alloc]init];
    }
    return myInstance;
}

//加载激励广告
- (void)loadAd:(NSDictionary *)arguments{
    self.codeId = arguments[@"iosId"];
    self.adCenter = [[MYAdCenter alloc] init] ;
    MYRewardVideoAdData *data = [[MYRewardVideoAdData alloc] init];
    data.positionID = self.codeId;
    data.rootViewController = [UIViewController jsd_getCurrentViewController];
    data.rewardVideoAdDelegate = self;
    data.showDirection = MYAdShowDirection_Vertical;
    [self.adCenter my_showRewardVideoAd:data];
}

#pragma mark - 广告请求delegate

///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onRewardAdFail:(NSString*)error{
    NSLog(@"激励广告加载失败%@",error);
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onError",@"msg":error.description};
    [[QBAdEvent sharedInstance] sentEvent:dictionary];
}

///视频被点击
- (void) onRewardAdClicked{
    NSLog(@"激励广告点击");
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onClick"};
    [[QBAdEvent sharedInstance] sentEvent:dictionary];
}

///视频被关闭
- (void) onRewardAdClose{
    NSLog(@"激励广告关闭");
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onDismiss"};
    [[QBAdEvent sharedInstance] sentEvent:dictionary];
}

///视频广告曝光
- (void) onRewardAdExposure{
    NSLog(@"激励广告曝光");
}

///视频广告加载完成，此时播放视频不卡顿
- (void) onRewardVideoCached{
    NSLog(@"激励广告加载完成，开始播放");
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onShow"};
    [[QBAdEvent sharedInstance] sentEvent:dictionary];
    [self.adCenter showRewardVideoAd];
}

///激励视频触发激励（观看视频大于一定时长或者视频播放完毕）
- (void) onRewardVerify{
    NSLog(@"激励广告触发奖励");
    NSDictionary *dictionary = @{@"adType":@"rewardAd",@"onAdMethod":@"onReward",@"type":@"0"};
    [[QBAdEvent sharedInstance] sentEvent:dictionary];
}


@end
