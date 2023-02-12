//
//  QBLogUtil.m
//  Pods-Runner
//
//  Created by gstory on 2023/2/9.
//

#import <Foundation/Foundation.h>
#import "QBLogUtil.h"


@interface QBLogUtil()
@property(nonatomic,assign) BOOL isDebug;
@end


@implementation QBLogUtil

+ (instancetype)sharedInstance{
    static QBLogUtil *myInstance = nil;
    if(myInstance == nil){
        myInstance = [[QBLogUtil alloc]init];
    }
    return myInstance;
}

- (void)debug:(BOOL)isDebug{
    _isDebug = isDebug;
}

- (void)print:(NSString *)message{
    if(_isDebug){
        GLog(@"%@", message);
    }
}

@end
