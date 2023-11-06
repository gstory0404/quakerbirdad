//
//  MYContentStyleAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import "MYBaseAdData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYContentStyleAdData : MYBaseAdData
@property (nonatomic, weak) id <MYContentStyleAdDelegate> contentStyleAdDelegate;
/*
 内容样式的frame
*/
@property (nonatomic, assign) CGRect contentStyleViewFrame;
@end

NS_ASSUME_NONNULL_END
