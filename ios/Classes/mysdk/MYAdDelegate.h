//
//  MYAdDelegate.h
//  mySDK
//
//  Created by 凌锋晨 on 2020/11/24.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

#pragma mark 开屏广告回调
@protocol MYSplashAdDelegate <NSObject>

@optional

///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onSplashAdFail:(NSString*)error;

///广告渲染成功
- (void) onSplashAdExposure;

/// 广告被点击
- (void) onSplashAdClicked;

/// 广告被跳过
- (void) onSplashAdClose;

@end






#pragma mark 插屏广告回调
@protocol MYInterActionAdDelegate <NSObject>

@optional

///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onInterActionAdFail:(NSString*)error;

///广告渲染成功
- (void) onInterActionAdExposure;

///广告被关闭
- (void) onInterActionAdDismiss;

///广告被点击
- (void) onInterActionAdClicked;

/////视频准备就绪开始播放（非视频广告不回调）
- (void) onInterActionVideoReady;

/////视频播放完成（非视频广告不回调）
- (void) onInterActionVideoComplete;

@end



//#pragma mark 新插屏广告回调
//@protocol MYNewInterActionAdDelegate <NSObject>
//
//@optional
//
/////广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
//- (void) onNewInterActionAdFail:(NSString*)error;
//
/////广告渲染成功
//- (void) onNewInterActionAdExposure;
//
/////广告被关闭
//- (void) onNewInterActionAdDismiss;
//
/////广告被点击
//- (void) onNewInterActionAdClicked;
//
//@end



#pragma mark banner广告回调
@protocol MYBannerAdDelegate <NSObject>

@optional

///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onBannerAdFail:(NSString*)error;

///广告渲染成功
- (void) onBannerAdExposure;

///广告被关闭
- (void) onBannerAdDismiss;

///广告被点击
- (void) onBannerAdClicked;

///banner 高度(部分返回)
-(void) onBannerHeight:(CGFloat)height;

@end





#pragma mark 信息流广告广告回调
@protocol MYNativeAdDelegate <NSObject>

@optional

///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onNativeAdFail:(NSString*)error;

///广告加载成功，刷新数据
- (void) onNativeAdloadSuccessWithDataArray:(NSMutableArray *)adDataArray;

///点击不喜欢，关闭广告
- (void) onNativeAdClickDislike:(id)data;

///广告渲染成功
- (void) onNativeAdExposure;

///广告被关闭
- (void) onNativeAdDismiss;

///广告被点击
- (void) onNativeAdClicked;

///视频准备就绪开始播放（非视频广告不回调）
- (void) onNativeVideoReady;

///视频播放完成（非视频广告不回调）
- (void) onNativeVideoComplete;

@end





#pragma mark  激励视频广告回调
@protocol MYRewardVideoAdDelegate <NSObject>

@optional
///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onRewardAdFail:(NSString*)error;

///视频被点击
- (void) onRewardAdClicked;

///视频被关闭
- (void) onRewardAdClose;

///视频广告曝光
- (void) onRewardAdExposure;

///视频广告加载完成，此时播放视频不卡顿
- (void) onRewardVideoCached;

///激励视频触发激励（观看视频大于一定时长或者视频播放完毕）
- (void) onRewardVerify;

@end


#pragma mark  draw竖版视频信息流广告回调
@protocol MYDrawNativeVideoAdDelegate <NSObject>

@optional

///广告加载失败，msg加载失败说明（如果重新请求广告，注意：只重新请求一次）
- (void) onDrawNativeAdFail:(NSString*)error;

///视频被点击
- (void) onDrawNativeAdClicked;

/// 广告曝光回调
- (void) onDrawNativeRenderSuccess;

///广告加载成功，刷新数据
- (void) onDrawNativeAdloadSuccessWithDataArray:(NSMutableArray *)adDataArray;
@end


#pragma mark  UnifiedNativeAd
@protocol MYUnifiedNativeAdDelegate <NSObject>
@optional
//返回广告数据回调 unifiedNativeAdDataObjects数组中的元素类型为GDTUnifiedNativeAdDataObject
- (void)unifiedNativeAdLoaded:(NSArray * _Nullable)unifiedNativeAdDataObjects :(NSError * _Nullable)error;
//广告点击回调
- (void)unifiedNativeAdClick;
//广告展示回调
- (void)unifiedNativeAdExposure;
@end



#pragma mark  内容广告回调
@protocol MYContentStyleAdDelegate <NSObject>
@optional
/**
* 请求失败
*/
- (void)onContentStyleAd_loadFail;
/**
 * 视频开始播放
 * @param videoId       视频Id
 */
- (void)onContentStyleAd_videoDidStartPlay:(NSString *)videoId;
/**
* 视频暂停播放
* @param videoId        视频Id
*/
- (void)onContentStyleAd_videoDidPause:(NSString *)videoId;
/**
* 视频恢复播放
* @param videoId         视频Id
*/
- (void)onContentStyleAd_videoDidResume:(NSString *)videoId;
/**
* 视频停止播放
* @param videoId        视频Id
* @param finished        是否播放完成
*/
- (void)onContentStyleAd_videoDidEndPlay:(NSString *)videoId :(BOOL)finished;
/**
* 视频播放失败
* @param videoId        视频Id
* @param error          失败原因
*/
- (void)onContentStyleAd_videoDidFailedToPlay:(NSString *)videoId :(NSString *)error;
@end








#pragma mark  MYNewsAdDelegate
@protocol MYNewsAdDelegate <NSObject>
@optional
-(void)onLoadNewsDataFaill:(NSString *)error;
-(void)onLoadNewsDataSuccess:(UIViewController *)NewsController;
@end

NS_ASSUME_NONNULL_END
