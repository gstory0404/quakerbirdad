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

#pragma ??????
///?????????????????????msg?????????????????????????????????????????????????????????????????????????????????
- (void) onDrawNativeAdFail:(NSString*)error{
    NSLog(@"Draw?????????????????? %@",error);
    NSDictionary *dictionary = @{@"msg":error.description};
    [_channel invokeMethod:@"onError" arguments:dictionary result:nil];
}

///???????????????
- (void) onDrawNativeAdClicked{
    NSLog(@"Draw?????????????????????");
    [_channel invokeMethod:@"onClick" arguments:nil result:nil];
}

/// ??????????????????
- (void) onDrawNativeRenderSuccess{
    NSLog(@"Draw????????????");
}

///?????????????????????????????????
- (void) onDrawNativeAdloadSuccessWithDataArray:(NSMutableArray *)adDataArray{
    NSLog(@"Draw??????????????????");
    NSDictionary *dictionary = @{@"width":@(self.container.frame.size.width),@"height":@(self.container.frame.size.height)};
    [_channel invokeMethod:@"onShow" arguments:dictionary result:nil];
}

@end
