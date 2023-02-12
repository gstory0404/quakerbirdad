#import "QuakerbirdadPlugin.h"
#import "mysdk/MYSDKConfig.h"
#import "QBInsertAd.h"
#import "QBRewardAd.h"
#import "QBAdEvent.h"
#import "QBSplashAd.h"
#import "QBBannerAd.h"
#import "QBNativeAd.h"
#import "QBExpressAd.h"
#import "QBExpressDrawAd.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@implementation QuakerbirdadPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"quakerbirdad"
                                     binaryMessenger:[registrar messenger]];
    QuakerbirdadPlugin* instance = [[QuakerbirdadPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    //注册event
    [[QBAdEvent sharedInstance]  initEvent:registrar];
    //注册开屏广告
    [registrar registerViewFactory:[[QBSplashAdFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.gstory.quakerbirdad/SplashAdView"];
    //注册banner广告
    [registrar registerViewFactory:[[QBBannerAdFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.gstory.quakerbirdad/BannerAdView"];
    //注册信息流广告
    [registrar registerViewFactory:[[QBNativeAdFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.gstory.quakerbirdad/NativeAdView"];
    //注册自渲染广告
    [registrar registerViewFactory:[[QBExpressAdFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.gstory.quakerbirdad/ExpressAdView"];
    //注册自渲染Draw广告
    [registrar registerViewFactory:[[QBExpressDrawAdFactory alloc] initWithMessenger:registrar.messenger] withId:@"com.gstory.quakerbirdad/ExpressDrawAdView"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"register" isEqualToString:call.method]) {
        NSString *appId = call.arguments[@"iosAppId"];
        BOOL debug = [call.arguments[@"debug"] boolValue];
        [[MYSDKConfig getDefaultInstance] myShowLog:debug];
        [[MYSDKConfig getDefaultInstance] setAppID:appId callback:^(BOOL success) {
            NSLog(@"SDK初始化%@",success?@"YES":@"NO");
            result([NSNumber numberWithBool:success]);
        }];
    }else if ([@"getSDKVersion" isEqualToString:call.method]) {
        result(@"unknow");
    }else if ([@"loadInteractionAd" isEqualToString:call.method]) {
        [[QBInsertAd sharedInstance] loadAd:call.arguments :false];
        result(@YES);
    }else if ([@"loadFullScreenAd" isEqualToString:call.method]) {
        [[QBInsertAd sharedInstance] loadAd:call.arguments :true];
        result(@YES);
    }else if ([@"loadRewardVideoAd" isEqualToString:call.method]) {
        [[QBRewardAd sharedInstance] loadAd:call.arguments];
        result(@YES);
    }else if ([@"requestPermission" isEqualToString:call.method]) {
        if (@available(iOS 14, *)) {
            [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
                result(@(status));
            }];
        }else{
            result(@(3));
        }
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
