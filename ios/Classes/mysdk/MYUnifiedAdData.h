//
//  MYUnifiedAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import "MYBaseAdData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYUnifiedAdData : MYBaseAdData

@property (nonatomic, weak) id <MYUnifiedNativeAdDelegate> unifiedNativeAdDelegate;



/*
    加载广告的数量
*/
@property (nonatomic, assign) NSInteger loadAdCount;

@end

NS_ASSUME_NONNULL_END
