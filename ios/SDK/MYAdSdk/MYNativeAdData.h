//
//  MYNativeAdData.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import "MYBaseAdData.h"

NS_ASSUME_NONNULL_BEGIN

@interface MYNativeAdData : MYBaseAdData


@property (nonatomic, weak) id <MYNativeAdDelegate> nativeAdDelegate;

//请求广告数量 默认为3条
@property (nonatomic, assign) int nativeLoadAdCount;

/*
 主要控制广告view 在cell 上的frame，广告cell的高度通过接口获得，这边设置无效
*/
@property (nonatomic, assign) CGRect nativeAdFrame;
@end

NS_ASSUME_NONNULL_END
