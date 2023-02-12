//
//  KSCUMediaPlayer.h
//  KSAdSDK
//
//  Created by jie cai on 2020/7/13.
//
#import "KSCUPlayerSDK.h"

#if defined __has_include && __has_include(<KSMediaPlayer/KSMediaPlayer.h>) && !TARGET_IPHONE_SIMULATOR
    #ifndef KSCU_IMPORT_KSMediaPlayer
        #define KSCU_IMPORT_KSMediaPlayer 1
    #endif
#else
    #ifndef KSCU_IMPORT_KSMediaPlayer
        #define KSCU_IMPORT_KSMediaPlayer 0
    #endif
#endif

#if KSCU_IMPORT_KSMediaPlayer

#import <Foundation/Foundation.h>
#import <KSCUPlayer/KSCUPlayerProtocol.h>

NS_ASSUME_NONNULL_BEGIN
/// 集成 KSMediaPlayer 播放器
@interface KSCUMediaPlayer : NSObject<KSCUPlayerProtocol>

+ (void)configNativeCache;

@end

NS_ASSUME_NONNULL_END
#endif

