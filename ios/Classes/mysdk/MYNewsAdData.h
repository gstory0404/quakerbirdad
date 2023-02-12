//
//  MYNewsAdData.h
//  mySDK
//
//  Created by lfc on 2022/6/1.
//

#import "MYBaseAdData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYNewsAdData : MYBaseAdData

@property (nonatomic, weak) id <MYNewsAdDelegate> newsAdDelegate;

@end

NS_ASSUME_NONNULL_END
