//
//  QBUnifiedNativeImageView.h
//  MYSDKDemo
//
//  Created by 凌锋晨 on 2021/4/26.
//

#import "GDTUnifiedNativeAdView.h"
#import "MYAdCenter.h"
NS_ASSUME_NONNULL_BEGIN

@interface QBUnifiedNativeImageView : GDTUnifiedNativeAdView
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UIImageView *imageView;
//初始化接口
- (instancetype)initWithFrame:(CGRect)frame;

/// 赋值接口
/// @param unifiedNativeDataObject 广告数据
/// @param center 用于调用my_registerDataObject，绑定点击页面
/// @param rootViewController 点击之后跳转时需要一个锚点viewcontroller
//- (void)setupWithUnifiedNativeAdObject:(GDTUnifiedNativeAdDataObject *)unifiedNativeDataObject center:(QUBIADSdkCenter*)center rootViewController:(UIViewController *)rootViewController;
- (void)setupWithUnifiedNativeAdObject:(GDTUnifiedNativeAdDataObject *)unifiedNativeDataObject center:(MYAdCenter*)center rootViewController:(UIViewController *)rootViewController;

//计算广告高度接口
+(CGFloat)getViewHeightWithWidth:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
