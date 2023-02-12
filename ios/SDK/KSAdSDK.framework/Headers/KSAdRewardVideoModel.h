//
//  KSAdRewardVideoModel.h
//  KSUServerBidding
//
//  Created by 李姝谊 on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 同KSRewardedVideoModel完全一样 为了组件不循环依赖 写一个不同名但实际功能相同的类
@interface KSAdRewardVideoModel : NSObject
/**
 required.
 Third-party game user_id identity.
 Mainly used in the reward issuance, it is the callback pass-through parameter from server-to-server.
 It is the unique identifier of each user.
 In the non-server callback mode, it will also be pass-through when the video is finished playing.
 Only the string can be passed in this case, not nil.
 */
@property (nonatomic, copy) NSString *userId;
//optional. reward name.
@property (nonatomic, copy) NSString *name;
//optional. number of rewards.
@property (nonatomic, assign) NSInteger amount;
//optional. serialized string.
@property (nonatomic, copy) NSString *extra;

@end

NS_ASSUME_NONNULL_END
