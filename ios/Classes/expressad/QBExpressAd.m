//
//  QBExpressAd.m
//  Pods-Runner
//
//  Created by gstory on 2023/2/10.
//

#import "QBExpressAd.h"
#import "../mysdk/MYAdCenter.h"
#import "../utils/QBUIViewController+getCurrentVC.h"
#import "QBUnifiedNativeImageView.h"

@implementation QBExpressAdFactory{
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
    QBExpressAd * expressad = [[QBExpressAd alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return expressad;
}

@end


@interface QBExpressAd()<MYUnifiedNativeAdDelegate>

@property (nonatomic, strong) MYAdCenter *adCenter;
//广告view
@property (nonatomic, strong) QBUnifiedNativeImageView *adView;
@property(nonatomic,strong) UIView *container;
@property(nonatomic,assign) CGRect frame;
@property(nonatomic,assign) NSInteger viewId;
@property(nonatomic,strong) FlutterMethodChannel *channel;
@property(nonatomic,strong) NSString *codeId;
@property(nonatomic,assign) double width;
@property(nonatomic,assign) double height;
@end

@implementation QBExpressAd

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
        NSString* channelName = [NSString stringWithFormat:@"com.gstory.quakerbirdad/ExpressAdView_%lld", viewId];
        self.channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        self.container = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.width,self.height)];
        [self loadNativeAd];
    }
    return self;
}

- (UIView*)view{
    return self.container;
}

-(void)loadNativeAd{
    self.adCenter = [[MYAdCenter alloc] init] ;
    MYUnifiedAdData *data = [MYUnifiedAdData alloc];
    data.positionID = self.codeId;
    data.unifiedNativeAdDelegate = self;
    data.loadAdCount = 1;
    //步骤 1：根据宽度算出广告的高度
    double adViewHeight = [QBUnifiedNativeImageView getViewHeightWithWidth:self.width];
    //步骤 2：初始化广告view
    self.adView = [[QBUnifiedNativeImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, adViewHeight)];
    [self.adCenter my_requestUnifiedAd:data];
}

#pragma 回调
//返回广告数据回调 unifiedNativeAdDataObjects数组中的元素类型为GDTUnifiedNativeAdDataObject
- (void)unifiedNativeAdLoaded:(NSArray * _Nullable)unifiedNativeAdDataObjects :(NSError * _Nullable)error{
    NSLog(@"自渲染广告加载成功");
    if (!error && unifiedNativeAdDataObjects.count > 0) {
        //步骤 4：成功返回数据，赋值
        [self.adView setupWithUnifiedNativeAdObject:[unifiedNativeAdDataObjects firstObject] center:self.adCenter rootViewController:[UIViewController jsd_getCurrentViewController]];
        //步骤 5：添加广告页面到自己的页面上
        [self.container addSubview:self.adView];
        NSDictionary *dictionary = @{@"width":@(self.adView.frame.size.width),@"height":@(self.adView.frame.size.height)};
        [_channel invokeMethod:@"onShow" arguments:dictionary result:nil];
        return;
    }else{
        if(!error){
            NSDictionary *dictionary = @{@"msg":error.description};
            [_channel invokeMethod:@"onError" arguments:dictionary result:nil];
        }else{
            NSDictionary *dictionary = @{@"msg":@"暂无广告"};
            [_channel invokeMethod:@"onError" arguments:dictionary result:nil];
        }
    }
}

//广告点击回调
- (void)unifiedNativeAdClick{
    NSLog(@"自渲染广告点击回调");
    [_channel invokeMethod:@"onClick" arguments:nil result:nil];
}

//广告展示回调
- (void)unifiedNativeAdExposure{
    NSLog(@"自渲染广告展示回调");
}

@end
