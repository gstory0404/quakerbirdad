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

#pragma mark - ????????????delegate

///?????????????????????msg?????????????????????????????????????????????????????????????????????????????????
- (void) onSplashAdFail:(NSString*)error{
    NSLog(@"????????????????????????%@",error);
    NSDictionary *dictionary = @{@"msg":error.description};
    [_channel invokeMethod:@"onError" arguments:dictionary result:nil];
}

///??????????????????
- (void) onSplashAdExposure{
    NSLog(@"????????????????????????");
    [_channel invokeMethod:@"onShow" arguments:nil result:nil];
}

/// ???????????????
- (void) onSplashAdClicked{
    NSLog(@"??????????????????");
    [_channel invokeMethod:@"onClick" arguments:nil result:nil];
}

/// ???????????????
- (void) onSplashAdClose{
    NSLog(@"??????????????????");
    [_channel invokeMethod:@"onDismiss" arguments:nil result:nil];
    [self.adCenter my_closeSplashAd];
    self.adCenter = nil;
}

@end
