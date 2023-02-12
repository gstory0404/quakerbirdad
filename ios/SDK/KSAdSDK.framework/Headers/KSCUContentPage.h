//
//  KSCUContentPage.h
//  KSAdSDK
//
//  Created by jie cai on 2020/5/2.
//

#import <Foundation/Foundation.h>
#import "KSCUEmbedAdConfig.h"
#import "KSCUOuterController.h"
#import "KSCUCallBackProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSCUContentPage : NSObject<NSCopying>

@property (nonatomic, readonly) UIViewController *viewController;
///  内嵌广告配置.详情见 KSCUEmbedAdConfig 说明
@property (nonatomic, strong, readonly) KSCUEmbedAdConfig *embedAdConfig;
///  视频状态代理
@property (nonatomic, weak, nullable) id<KSCUVideoStateDelegate> videoStateDelegate;
///  页面状态代理
@property (nonatomic, weak, nullable) id<KSCUContentStateDelegate> stateDelegate;
///  内容页面代理
@property (nonatomic, weak, nullable) id<KSCUContentPageCallBackProtocol> callBackDelegate;
/// 是否支持左滑出现侧边栏
@property (nonatomic, assign) BOOL enableLeftSlide;

@property (nonatomic, strong) KSCUOuterController *outerController;

- (instancetype)initWithPosId:(NSString *)posId;
/**
 * @description 根据 deepLink 内容确认跳转界面，生成的 viewController，从KSCUContentPage.viewController 获取
 * @param posId     广告位 id
 * @param deepLink  deeplink
 * @return KSCUContentPage
*/
- (instancetype)initWithPosId:(NSString *)posId withDeepLink:(NSString *)deepLink;

- (void)tryToRefresh;

#pragma mark - 电商使用
- (instancetype)initWithPosId:(NSString *)posId promoteID:(nullable NSString *)promoteID comment:(nullable NSString *)comment;
- (instancetype)initWithPosId:(NSString *)posId withDeepLink:(NSString *)deepLink promoteID:(nullable NSString *)promoteID comment:(nullable NSString *)comment;

#pragma mark - 挽留弹窗相关
/**
 外部触发挽留弹窗时调用
 参数1：type：挽留的场景， 3-back键；4-切换tab
 block返回值：弹窗消失时，点击的区域,媒体基本只需要关心点击残忍离开的场景，也就是closeType = 1
 方法返回值：BOOL，是否可以正常展示挽留弹窗
 */
- (BOOL)interceptWithSourceType:(NSInteger)type closeBlock:(nullable void(^)(NSInteger closeType))interceptViewCloseBlock;

@end

NS_ASSUME_NONNULL_END
