//
//  QBFeedAd.m
//  Pods-Runner
//
//  Created by gstory on 2023/2/10.
//

#import "QBNativeAd.h"
#import "../mysdk/MYAdCenter.h"
#import "../utils/QBUIViewController+getCurrentVC.h"

@implementation QBNativeAdFactory{
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
    QBNativeAd * nativead = [[QBNativeAd alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return nativead;
    
}

@end


@interface QBNativeAd()<MYNativeAdDelegate>

@property (nonatomic, strong) MYAdCenter *adCenter;
@property(nonatomic,strong) UIView *container;
@property(nonatomic,assign) CGRect frame;
@property(nonatomic,assign) NSInteger viewId;
@property(nonatomic,strong) FlutterMethodChannel *channel;
@property(nonatomic,strong) NSString *codeId;
@property(nonatomic,assign) double width;
@property(nonatomic,assign) double height;
@end

@implementation QBNativeAd

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
        NSString* channelName = [NSString stringWithFormat:@"com.gstory.quakerbirdad/NativeAdView_%lld", viewId];
        self.channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        self.container = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.width,self.height)];
        [self loadFeedAd];
    }
    return self;
}

- (UIView*)view{
    return self.container;
}

-(void)loadFeedAd{
    self.adCenter = [[MYAdCenter alloc] init] ;
    MYNativeAdData *data = [MYNativeAdData alloc];
    data.positionID = self.codeId;
    data.rootViewController = [UIViewController jsd_getCurrentViewController];
    data.nativeAdDelegate = self;
    data.nativeAdFrame = CGRectMake(0, 0, self.width, self.height);
    data.nativeLoadAdCount = 1;
    [self.adCenter my_showNativeAd:data];
}

#pragma 回调
///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onNativeAdFail:(NSString*)error{
    NSLog(@"信息流广告加载失败%@",error);
    NSDictionary *dictionary = @{@"msg":error.description};
    [_channel invokeMethod:@"onError" arguments:dictionary result:nil];
}

///广告加载成功，刷新数据
- (void) onNativeAdloadSuccessWithDataArray:(NSMutableArray *)adDataArray{
    NSLog(@"信息流广告加载成功");
    if(adDataArray.count > 0){
        NSArray *subviews = self.container.subviews;
        if(subviews)
        {
            for (UIView *view in subviews) {
                [view removeFromSuperview];
            }
        }
        UIView *view = [adDataArray firstObject];
        //刷新广告容器的宽高，使之与广告相匹配
        self.container.frame = CGRectMake(self.container.frame.origin.x, self.container.frame.origin.y, self.view.frame.size.width, view.frame.size.height);
        [self.container addSubview:view];
        NSDictionary *dictionary = @{@"width":@(self.view.frame.size.width),@"height":@(view.frame.size.height)};
        [_channel invokeMethod:@"onShow" arguments:dictionary result:nil];
    }
}

///点击不喜欢，关闭广告
- (void) onNativeAdClickDislike:(id)data{
    NSLog(@"信息流广告点击不喜欢，关闭广告");
}

///广告渲染成功
- (void) onNativeAdExposure{
    NSLog(@"信息流广告渲染成功");
}

///广告被关闭
- (void) onNativeAdDismiss{
    NSLog(@"信息流广告被关闭");
    [_channel invokeMethod:@"onDismiss" arguments:nil result:nil];
}

///广告被点击
- (void) onNativeAdClicked{
    NSLog(@"信息流广告被点击");
    [_channel invokeMethod:@"onClick" arguments:nil result:nil];
}

///视频准备就绪开始播放（非视频广告不回调）
- (void) onNativeVideoReady{
    NSLog(@"信息流广告视频准备就绪开始播放（非视频广告不回调");
}

///视频播放完成（非视频广告不回调）
- (void) onNativeVideoComplete{
    NSLog(@"信息流广告视频播放完成（非视频广告不回调）");
}


@end
