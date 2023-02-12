//
//  QBSplashAd.m
//  quakerbirdad
//
//  Created by gstory on 2023/2/9.
//

#import "QBSplashAd.h"
#import "../mysdk/MYAdCenter.h"
#import "../utils/QBUIViewController+getCurrentVC.h"

@implementation QBSplashAdFactory{
    NSObject<FlutterBinaryMessenger>*_messenger;
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        _messenger = messager;
    }
    return self;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

-(NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    QBSplashAd * splashAd = [[QBSplashAd alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    
    return splashAd;
    
}

@end


@interface QBSplashAd()<MYSplashAdDelegate>

@property (nonatomic, strong) MYAdCenter *adCenter;
@property(nonatomic,strong) UIView *container;
@property(nonatomic,assign) CGRect frame;
@property(nonatomic,assign) NSInteger viewId;
@property(nonatomic,strong) FlutterMethodChannel *channel;
@property(nonatomic,strong) NSString *codeId;
@end

@implementation QBSplashAd

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        NSDictionary *dic = args;
        self.frame = frame;
        self.viewId = viewId;
        self.codeId = dic[@"iosId"];
        NSString* channelName = [NSString stringWithFormat:@"com.gstory.quakerbirdad/SplashAdView_%lld", viewId];
        self.channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        [self loadSplashAd];
    }
    return self;
}

- (UIView*)view{
    return self.container;
}

-(void)loadSplashAd{
    self.adCenter = [[MYAdCenter alloc] init] ;
    MYSplashAdData *data = [MYSplashAdData alloc];
    data.positionID = self.codeId;
    data.rootViewController = [UIViewController jsd_getCurrentViewController];
    data.splashDelegate = self;
    //    data.bottomView = bottomView;
    [self.adCenter my_showSplashAd:data];
}

#pragma mark - 广告请求delegate

///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onSplashAdFail:(NSString*)error{
    NSLog(@"开屏广告加载失败%@",error);
    NSDictionary *dictionary = @{@"msg":error.description};
    [_channel invokeMethod:@"onError" arguments:dictionary result:nil];
}

///广告渲染成功
- (void) onSplashAdExposure{
    NSLog(@"开屏广告渲染成功");
    [_channel invokeMethod:@"onShow" arguments:nil result:nil];
}

/// 广告被点击
- (void) onSplashAdClicked{
    NSLog(@"开屏广告点击");
    [_channel invokeMethod:@"onClick" arguments:nil result:nil];
}

/// 广告被跳过
- (void) onSplashAdClose{
    NSLog(@"开屏广告关闭");
    [_channel invokeMethod:@"onDismiss" arguments:nil result:nil];
    [self.adCenter my_closeSplashAd];
    self.adCenter = nil;
}

@end
