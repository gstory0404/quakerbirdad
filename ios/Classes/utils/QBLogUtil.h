//
//  QBLogUtil.h
//  Pods-Runner
//
//  Created by gstory on 2023/2/9.
//

#ifdef DEBUG
#define GLog(...) NSLog(@"%s\n %@\n\n", __func__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define GLog(...)
#endif

NS_ASSUME_NONNULL_BEGIN

@interface QBLogUtil : NSObject
+ (instancetype)sharedInstance;
- (void)debug:(BOOL)isDebug;
- (void)print:(NSString *)message;
@end

NS_ASSUME_NONNULL_END

