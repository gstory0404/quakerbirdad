//
//  KSCUSDKManager.h
//  KSUCTBaseFunc
//
//  Created by qingxu zhou on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSCUSDKManager : NSObject

/// 设置加载动画颜色，全局生效
/// @param color 加载动画颜色
+ (void)setLoadingColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
