//
//  MYBannerAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import "MYBaseAdData.h"

NS_ASSUME_NONNULL_BEGIN
@interface MYBannerAdData : MYBaseAdData

@property (nonatomic, weak) id <MYBannerAdDelegate> bannerAdDelegate;


/*
 bannerAd的frame
 如果没有superView，banner广告加载在RootViewController.view上
 有superView，banner广告加载在superview上
*/
@property (nonatomic, assign) CGRect bannerFrame;

/*
 banner广告的加载在自定义superView上,不设置则加载在RootViewController.view上
*/
@property (nonatomic, weak, nullable) UIView *bannerSuperView;

@end

NS_ASSUME_NONNULL_END
