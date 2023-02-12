//
//  KSCUTubePage.h
//  KSAdSDK
//
//  Created by qingxu zhou on 2021/9/24.
//

#import <Foundation/Foundation.h>
#import "KSCUTubeColorConfig.h"
#import "KSCUCallBackProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSCUTubePageConfig : NSObject
@property (nonatomic, weak) id<KSCUContentStateDelegate> stateDelegate;
@property (nonatomic, weak) id<KSCUVideoStateDelegate> videoStateDelegate;
@property (nonatomic, weak) id<KSCUContentPageCallBackProtocol> callBackDelegate;
@property (nonatomic, assign) BOOL showNavigation;
@end

@interface KSCUTubePage : NSObject
@property (nonatomic, readonly) UIViewController *viewController;
- (instancetype)initWithPosId:(NSString *)posId configBuilder:(void(^ _Nullable)(KSCUTubePageConfig *config))configBuilder NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/// 设置显示模式
/// @param colorMode 显示模式
/// @param colorConfig 自定义颜色，只有当设置模式为自定义时才会生效
- (void)setColorMode:(KSCUTubeColorMode)colorMode colorConfig:(nullable KSCUTubeColorConfig *)colorConfig;

@end

NS_ASSUME_NONNULL_END
