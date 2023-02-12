//
//  KSCUMediaPlayerActionMeta.h
//  KSAdSDK
//
//  Created by jie cai on 2020/7/20.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSCUMediaPlayerActionMeta : NSObject

@property (nonatomic, copy) NSString *actionId;
@property (nonatomic, copy) NSString *timestamp;
/// 会话id,uuid生成,冷启动和收到后台超过一段时间回来会变（和内容一致）
@property (nonatomic, copy) NSString *sessionId;
@property (nonatomic, copy) NSString *seq;
/// 媒体播放器Log行为类型
@property (nonatomic, copy) NSString *mediaPlayerAction;
/// 媒体播放器Log行为Message
@property (nonatomic, copy) NSString *mediaPlayerMsg;

@end

NS_ASSUME_NONNULL_END
