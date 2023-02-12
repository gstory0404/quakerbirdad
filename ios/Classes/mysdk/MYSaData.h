//
//  MYSaData.h
//  LFCAdSdk
//
//  Created by 凌锋晨 on 2022/1/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, showType) {
    showType_push,
    showType_present,
};

@interface MYSaData : NSObject

//必填，用户id
@property (nonatomic, strong) NSString *thirdUserId;
//必填，模块id
@property (nonatomic, strong) NSString *moduleGroupId;
//必填，appid
@property (nonatomic, strong) NSString *appId;

//必填  弹出界面方式
@property (nonatomic, assign) showType aShowType;


//以下属性如果模块中有游戏模块的，则必填；没有游戏模块的，则可以不填
/*
 用户昵称，如果没有昵称，可以用uid代替
*/
@property (nonatomic, copy) NSString *nick;
/*
 用户性别，1：男；2：女；0：其他未知
*/
@property (nonatomic, assign) int sex;
/*
 用户头像，如果没有用户头像，可传入空字符串
*/
@property (nonatomic, copy) NSString *avatar;
@end

NS_ASSUME_NONNULL_END
