//
//  MYInterActionAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import "MYBaseAdData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYInterActionAdData : MYBaseAdData

@property (nonatomic, weak) id <MYInterActionAdDelegate> interActionAdDelegate;

@end

NS_ASSUME_NONNULL_END
