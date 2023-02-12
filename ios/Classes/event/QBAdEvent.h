//
//  QBAdEvent.h
//  quakerbirdad
//
//  Created by gstory on 2023/2/9.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface QBAdEvent : NSObject
+ (instancetype)sharedInstance;
- (void)initEvent:(NSObject<FlutterPluginRegistrar>*)registrar;
- (void)sentEvent:(NSDictionary*)arguments;
@end

NS_ASSUME_NONNULL_END
