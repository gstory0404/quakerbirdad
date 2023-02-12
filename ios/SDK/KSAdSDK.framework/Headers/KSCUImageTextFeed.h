//
//  KSCUImageTextFeed.h
//  KSAdSDK
//
//  Created by jie cai on 2021/3/31.
//

#import <Foundation/Foundation.h>
#import "KSCUImageTextFeedDelegate.h"
#import "KSCUHorizontalFeedCallBackProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface KSCUImageTextFeedConfig : NSObject

@property (nonatomic, weak) id<KSCUHorizontalFeedCallBackProtocol> videoDetailDelegate;
@property (nonatomic, weak) id<KSCUImageTextDetailDelegate> imageTextDelegate;

@end

@interface KSCUImageTextFeed : NSObject

@property (nonatomic, readonly) UIViewController *feedViewController;
/// 配置信息流标题字体大小[18 ~ 24]
@property (nonatomic, assign) CGFloat titleFontSize;

- (instancetype)initWithPosId:(NSString *)posId NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithPosId:(NSString *)posId
                configBuilder:(void(^ _Nullable)(KSCUImageTextFeedConfig *config) )configBuilder NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
