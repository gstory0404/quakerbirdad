//
//  QBRewardAd.h
//  quakerbirdad
//
//  Created by gstory on 2023/2/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QBRewardAd : NSObject
+ (instancetype)sharedInstance;
- (void)loadAd:(NSDictionary *)arguments;
@end

NS_ASSUME_NONNULL_END
