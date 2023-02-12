//
//  QBExpressDrawAd.m
//  quakerbirdad
//
//  Created by gstory on 2023/2/10.
//

#import "QBExpressDrawAd.h"
#import "../mysdk/MYAdCenter.h"
#import "../utils/QBUIViewController+getCurrentVC.h"

@implementation QBExpressDrawAdFactory{
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
    QBExpressDrawAd * expressDrawAd = [[QBExpressDrawAd alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return expressDrawAd;
}

@end


@interface QBExpressDrawAd()<MYDrawNativeVideoAdDelegate>

@property (nonatomic, strong) MYAdCenter *adCenter;
@property(nonatomic,strong) UIView *container;
@property(nonatomic,assign) CGRect frame;
@property(nonatomic,assign) NSInteger viewId;
@property(nonatomic,strong) FlutterMethodChannel *channel;
@property(nonatomic,strong) NSString *codeId;
@property(nonatomic,assign) double width;
@property(nonatomic,assign) double height;
@end

@implementation QBExpressDrawAd

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
        NSString* channelName = [NSString stringWithFormat:@"com.gstory.quakerbirdad/ExpressDrawAdView_%lld", viewId];
        self.channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        self.container = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.width,self.height)];
        [self loadExpressDrawAd];
    }
    return self;
}

- (UIView*)view{
    return self.container;
}

-(void)loadExpressDrawAd{
    self.adCenter = [[MYAdCenter alloc] init] ;
    MYDrawNativeVideoAdData *data = [MYDrawNativeVideoAdData alloc];
    data.positionID = self.codeId;
    data.drawNativeVideoAdDelegate = self;
    data.adFrame = self.container.frame;
    data.drawAdContainerView = self.container;
    data.loadDrawAdCount = 1;
    data.rootViewController = [UIViewController jsd_getCurrentViewController];
    [self.adCenter my_showDrawNativeVideoAd:data];
}

#pragma 回调
///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onDrawNativeAdFail:(NSString*)error{
    NSLog(@"Draw广告加载失败 %@",error);
    NSDictionary *dictionary = @{@"msg":error.description};
    [_channel invokeMethod:@"onError" arguments:dictionary result:nil];
}

///视频被点击
- (void) onDrawNativeAdClicked{
    NSLog(@"Draw广告视频被点击");
    [_channel invokeMethod:@"onClick" arguments:nil result:nil];
}

/// 广告曝光回调
- (void) onDrawNativeRenderSuccess{
    NSLog(@"Draw广告曝光");
}

///广告加载成功，刷新数据
- (void) onDrawNativeAdloadSuccessWithDataArray:(NSMutableArray *)adDataArray{
    NSLog(@"Draw广告加载成功");
    NSDictionary *dictionary = @{@"width":@(self.container.frame.size.width),@"height":@(self.container.frame.size.height)};
    [_channel invokeMethod:@"onShow" arguments:dictionary result:nil];
}

@end
