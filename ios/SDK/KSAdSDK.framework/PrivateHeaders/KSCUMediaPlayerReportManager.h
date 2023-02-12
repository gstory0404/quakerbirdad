//
//  KSCUMediaPlayerReportManager.h
//  KSAdSDK
//
//  Created by jie cai on 2020/7/20.
//
#import <Foundation/Foundation.h>

/*
  doc:
 https://docs.corp.kuaishou.com/d/home/fcADLf9f6v_kTQ_NMKz6jvtZ4#section=h.c7zqr0pnnkjb
 */

NS_ASSUME_NONNULL_BEGIN

@interface KSCUMediaPlayerReportManager : NSObject

+ (instancetype)sharedInstance;

- (void)addMediaPlayerActionKey:(NSString *)key value:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
