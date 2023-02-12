//
//  KSCUHorizontalFeedCallBackProtocol.h
//  KSUCTHFeedImpl
//
//  Created by qingxu zhou on 2021/11/2.
//

#import <Foundation/Foundation.h>
#import "KSCUContentPageDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@protocol KSCUHorizontalFeedCallBackProtocol <KSCUVideoStateDelegate, KSCUContentStateDelegate>
@optional
/// 进入横版视频详情页
/// @param viewController 详情页VC
/// @param contentInfo 视频信息
- (void)kscu_horizontalFeedDetailDidEnter:(UIViewController *)viewController contentInfo:(id<KSCUContentInfo>)contentInfo;

/// 离开横版视频详情页
/// @param viewController 详情页VC
- (void)kscu_horizontalFeedDetailDidLeave:(UIViewController *)viewController;

/// 视频详情页appear
/// @param viewController 详情页VC
- (void)kscu_horizontalFeedDetailDidAppear:(UIViewController *)viewController;

/// 详情页disappear
/// @param viewController 详情页VC
- (void)kscu_horizontalFeedDetailDidDisappear:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
