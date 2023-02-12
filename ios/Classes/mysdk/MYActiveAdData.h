//
//  MYActiveAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2022/3/24.
//

#import "MYBaseAdData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYActiveAdData : MYBaseAdData
/*
 必填
 用户的ID，请确保渠道用户id的唯一性
*/
@property (nonatomic, copy) NSString *uid;
/*
 必填
 用户昵称，如果没有昵称，可以用uid代替
*/
@property (nonatomic, copy) NSString *nick;
/*
 必填
 用户性别，1：男；2：女；0：其他未知
*/
@property (nonatomic, assign) int sex;
/*
 选填
 用户头像，如果没有用户头像，可传入渠道默认的头像地址
*/
@property (nonatomic, copy) NSString *avatar;

@end

NS_ASSUME_NONNULL_END
