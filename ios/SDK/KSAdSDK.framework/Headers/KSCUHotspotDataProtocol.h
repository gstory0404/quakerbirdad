//
//  KSCUHotspotDataProtocol.h
//  KSAdSDK
//
//  Created by 臧密娜 on 2021/5/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KSCUHotspotDataProtocol <NSObject>

/// 排名
@property (nonatomic, assign, readonly) NSInteger rank;
/// 标题名
@property (nonatomic, copy, readonly) NSString *name;
/// 首个视频的封面
@property (nonatomic, copy, readonly) NSString *coverUrl;
/// 视频数
@property (nonatomic, assign, readonly) NSInteger photoCount;
/// 播放量
@property (nonatomic, assign, readonly) int64_t viewCount;

@end

NS_ASSUME_NONNULL_END
