//
//  MYBaseAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import <Foundation/Foundation.h>
#import "MYAdDelegate.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MYAdShowDirection) {
    MYAdShowDirection_Vertical         =           0,   //竖屏
    MYAdShowDirection_Horizontal,
};

@interface MYBaseAdData : NSObject
/*
 广告位ID  必传
 后台-广告位管理里面对应的id
*/
@property (nonatomic, copy) NSString *positionID;



/*
 rootViewController (除了信息流自渲染广告不需要传，其余的广告类型都需要传)
 用来处理广告跳转或者显示，请确保传入的rootViewController不能为空且没有present其他的控制器，否则会出现presentedViewController已经存在而导致present失败。
*/
@property (nonatomic, weak) UIViewController *rootViewController;

/*
 渠道号
 后台-渠道号管理里面对应的渠道号
 与渠道版本号对应，且配套使用，可控制是否显示广告
*/
@property (nonatomic, copy ,nullable) NSString *channelNum;

/*
 版本号
 后台-渠道号管理里面对应的版本号
 与渠道号对应，且配套使用，可控制是否显示广告
*/
@property (nonatomic, copy ,nullable) NSString *channelVersion;

@end

NS_ASSUME_NONNULL_END
