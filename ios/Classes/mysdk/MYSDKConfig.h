//
//  MYSDKConfig.h
//  mySDK
//
//  Created by 凌锋晨 on 2020/11/25.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^MYConfigBlock)(BOOL success);

@interface MYSDKConfig : NSObject

+(instancetype)getDefaultInstance;

-(void)setAppID:(NSString *)appId callback:(MYConfigBlock)block;

-(void)myShowLog:(BOOL)showLog;

//[废弃]
///*
//是否为全球版sdk
//YES:全球版sdk(默认为yes，全球版sdk)
//NO:国内版sdk
//*/
//@property (nonatomic, assign) BOOL isGlobalSdk;

//个性化推荐开关:关闭后，看到的广告数量不变，相关度将降低。
// 是否允许开启广告的个性化推荐(NO-关闭，YES-开启)。不设置的话则默认为YES(允许个性化推荐)。
-(void)setEnablePersonalRecommend:(BOOL)enable;

@end

NS_ASSUME_NONNULL_END
