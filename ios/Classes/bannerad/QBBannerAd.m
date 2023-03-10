//
//  QBBannerAd.m
//  quakerbirdad
//
//  Created by gstory on 2023/2/9.
//

#import "QBBannerAd.h"
#import "../mysdk/MYAdCenter.h"
#import "../utils/QBUIViewController+getCurrentVC.h"

@implementation QBBannerAdFactory{
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
    QBBannerAd * bannerad = [[QBBannerAd alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    
    return bannerad;
    
}

@end


@interface QBBannerAd()<MYBannerAdDelegate>

@property (nonatomic, strong) MYAdCenter *adCenter;
@property(nonatomic,strong) UIView *container;
@property(nonatomic,assign) CGRect frame;
@property(nonatomic,assign) NSInteger viewId;
@property(nonatomic,strong) FlutterMethodChannel *channel;
@property(nonatomic,strong) NSString *codeId;
@property(nonatomic,assign) double width;
@property(nonatomic,assign) double height;
@end

@implementation QBBannerAd

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        NSDictionary *dic = args;
        self.frame = frame;
        self.viewId = viewId;
        self.codeId = dic[@"iosId"];
        NSNumber *viewWidth = dic[@"width"];
        NSNumber *viewHeight = dic[@"height"];
        self.width = [viewWidth doubleValue];
        self.height = [viewHeight doubleValue];
        NSString* channelName = [NSString stringWithFormat:@"com.gstory.quakerbirdad/BannerAdView_%lld", viewId];
        self.channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        self.container = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.width,self.height)];
        [self loadSplashAd];
    }
    return self;
}

- (UIView*)view{
    return self.container;
}

-(void)loadSplashAd{
    self.adCenter = [[MYAdCenter alloc] init] ;
    MYBannerAdData *data = [MYBannerAdData alloc];
    data.positionID = self.codeId;
    data.rootViewController = [UIViewController jsd_getCurrentViewController];
    data.bannerAdDelegate = self;
    data.bannerFrame = CGRectMake(0, 0, self.width, self.height);
    data.bannerSuperView = self.container;
    [self.adCenter my_showBannerAd:data];
}

#pragma ??????

///?????????????????????msg?????????????????????????????????????????????????????????????????????????????????
- (void) onBannerAdFail:(NSString*)error{
    NSLog(@"Banner??????????????????%@",error);
    NSDictionary *dictionary = @{@"msg":error.description};
    [_channel invokeMethod:@"onError" arguments:dictionary result:nil];
}

///??????????????????
- (void) onBannerAdExposure{
    NSLog(@"Banner??????????????????");
    NSDictionary *dictionary = @{@"width":@(self.width),@"height":@(self.height)};
    [_channel invokeMethod:@"onShow" arguments:dictionary result:nil];
}

///???????????????
- (void) onBannerAdDismiss{
    NSLog(@"Banner????????????");
    [_channel invokeMethod:@"onDismiss" arguments:nil result:nil];
}

///???????????????
- (void) onBannerAdClicked{
    NSLog(@"Banner????????????");
    [_channel invokeMethod:@"onClick" arguments:nil result:nil];
}

///banner ??????(????????????)
-(void) onBannerHeight:(CGFloat)height{
    NSLog(@"Banner???????????? %f",height);
}

@end
