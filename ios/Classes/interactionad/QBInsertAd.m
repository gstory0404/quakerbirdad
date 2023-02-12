//
//  QBInsertAd.m
//  Pods
//
//  Created by gstory on 2023/2/9.
//

#import "QBInsertAd.h"
#import "../mysdk/MYInterActionAdData.h"
#import "../mysdk/MYAdCenter.h"
#import "../utils/QBUIViewController+getCurrentVC.h"
#import "../event/QBAdEvent.h"

@interface QBInsertAd()<MYInterActionAdDelegate>
@property(nonatomic,strong) MYAdCenter *adCenter;
@property(nonatomic,strong) NSString *codeId;
@property(nonatomic,assign) BOOL isFull;
@end

@implementation QBInsertAd
+ (instancetype)sharedInstance{
    static QBInsertAd *myInstance = nil;
    if(myInstance == nil){
        myInstance = [[QBInsertAd alloc]init];
    }
    return myInstance;
}

//加载插屏广告
- (void)loadAd:(NSDictionary *)arguments:(BOOL)isFull{
    self.codeId = arguments[@"iosId"];
    self.adCenter = [[MYAdCenter alloc] init];
    self.isFull = isFull;
    MYInterActionAdData *data = [[MYInterActionAdData alloc] init];
    data.positionID = self.codeId;
    data.rootViewController = [UIViewController jsd_getCurrentViewController];
    data.interActionAdDelegate = self;
    [self.adCenter my_showInterActionAd:data];
}

#pragma mark - 广告请求delegate

///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onInterActionAdFail:(NSString*)error{
    NSLog(@"插屏广告加载失败%@",error);
    if(self.isFull){
        NSDictionary *dictionary = @{@"adType":@"fullScreenAd",@"onAdMethod":@"onError",@"msg":error.description};
        [[QBAdEvent sharedInstance] sentEvent:dictionary];
    }else{
        NSDictionary *dictionary = @{@"adType":@"interactionAd",@"onAdMethod":@"onError",@"msg":error.description};
        [[QBAdEvent sharedInstance] sentEvent:dictionary];
    }
}

///广告渲染成功
- (void) onInterActionAdExposure{
    NSLog(@"插屏广告渲染成功");
    if(self.isFull){
        NSDictionary *dictionary = @{@"adType":@"fullScreenAd",@"onAdMethod":@"onShow"};
        [[QBAdEvent sharedInstance] sentEvent:dictionary];
    }else{
        NSDictionary *dictionary = @{@"adType":@"interactionAd",@"onAdMethod":@"onShow"};
        [[QBAdEvent sharedInstance] sentEvent:dictionary];
    }
}

///广告被关闭
- (void) onInterActionAdDismiss{
    NSLog(@"插屏广告被关闭");
    if(self.isFull){
        NSDictionary *dictionary = @{@"adType":@"fullScreenAd",@"onAdMethod":@"onDismiss"};
        [[QBAdEvent sharedInstance] sentEvent:dictionary];
    }else{
        NSDictionary *dictionary = @{@"adType":@"interactionAd",@"onAdMethod":@"onDismiss"};
        [[QBAdEvent sharedInstance] sentEvent:dictionary];
    }
}

///广告被点击
- (void) onInterActionAdClicked{
    if(self.isFull){
        NSDictionary *dictionary = @{@"adType":@"fullScreenAd",@"onAdMethod":@"onClick"};
        [[QBAdEvent sharedInstance] sentEvent:dictionary];
    }else{
        NSDictionary *dictionary = @{@"adType":@"interactionAd",@"onAdMethod":@"onClick"};
        [[QBAdEvent sharedInstance] sentEvent:dictionary];
    }
}

/////视频准备就绪开始播放（非视频广告不回调）
- (void) onInterActionVideoReady{
    
}

/////视频播放完成（非视频广告不回调）
- (void) onInterActionVideoComplete{
    
}


@end
