//
//  QBInsertAd.h
//  Pods
//
//  Created by gstory on 2023/2/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QBInsertAd : NSObject
+ (instancetype)sharedInstance;
- (void)loadAd:(NSDictionary *)arguments:(BOOL)isFull;
@end

NS_ASSUME_NONNULL_END
