//
//  MYDrawNativeVideoAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import "MYBaseAdData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYDrawNativeVideoAdData : MYBaseAdData



@property (nonatomic, weak) id <MYDrawNativeVideoAdDelegate> drawNativeVideoAdDelegate;

//请求广告数量,<=0 时，取值为3
@property (nonatomic, assign) int loadDrawAdCount;



/*
 此属性只用于DrawAd显示一条时用。
*/
@property (nonatomic, weak,nullable) UIView *drawAdContainerView;

//adSize不赋值，广告显示页面大小，adSize赋值，就显示adSize的大小
@property (nonatomic, assign) CGRect adFrame;

@end

NS_ASSUME_NONNULL_END
