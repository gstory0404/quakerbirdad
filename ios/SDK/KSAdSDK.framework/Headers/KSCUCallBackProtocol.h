//
//  KSCUCallBackProtocol.h
//  KSAdSDK
//
//  Created by jie cai on 2021/1/15.
//

#import <Foundation/Foundation.h>
#import "KSCUFeedEvent.h"
#import "KSCUContentPageDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KSCURequestCallBackProtocol,KSCUUserInteractionCallBackProtocol;

@protocol KSCUContentPageCallBackProtocol <KSCURequestCallBackProtocol, KSCUUserInteractionCallBackProtocol>

@end

@protocol KSCUFeedPageCallBackProtocol <KSCUContentPageCallBackProtocol>

@end

/// feed 请求回调协议
@protocol KSCURequestCallBackProtocol <NSObject>

@optional
/// 请求开始回调
- (void)kscuContentRequestStart:(KSCUFeedEvent *)event;
/// 请求成功回调
- (void)kscuContentRequestSuccess:(KSCUFeedEvent *)event
                         callBack:(KSCUResponseObj *)responseObj;
/// 请求开失败回调
- (void)kscuContentRequestFail:(KSCUFeedEvent *)event;

@end

@protocol KSCUUserInteractionCallBackProtocol <NSObject>

@optional
- (void)kscuClickContentShareWithItem:(NSString *)shareItem;

- (void)kscuAvaterDidClick:(KSCUContentType)contentType;

- (void)kscuLikeDidClick:(KSCUContentType)contentType isLike:(BOOL)isLike;

- (void)kscuCommentDidClick:(KSCUContentType)contentType;

- (void)kscuSaleListDidClick:(NSString *)liveId;

- (void)kscuBuyButtonDidClick:(NSString *)liveId;

- (void)kscuGotoKwaiDidClick:(NSString *)liveId;

@end

NS_ASSUME_NONNULL_END
