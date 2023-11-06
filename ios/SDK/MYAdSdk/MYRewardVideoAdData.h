//
//  MYRewardVideoAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import "MYBaseAdData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYRewardVideoAdData : MYBaseAdData

@property (nonatomic, weak) id <MYRewardVideoAdDelegate> rewardVideoAdDelegate;

/*
 横屏还是竖屏广告
*/
@property (nonatomic, assign) MYAdShowDirection showDirection;



/*
 接入方的用户唯一标识符
*/
@property (nonatomic, copy) NSString *userId;



/*
 接入方需要传递的额外信息
*/
@property (nonatomic, copy) NSString *extraData;


@end

NS_ASSUME_NONNULL_END
