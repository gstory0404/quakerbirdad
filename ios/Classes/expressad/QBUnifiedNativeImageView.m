//
//  QBUnifiedNativeImageView.m
//  MYSDKDemo
//
//  Created by 凌锋晨 on 2021/4/26.
//

#import "QBUnifiedNativeImageView.h"

#define descLabelHeight 30
#define descLabel_to_imageView 7

@implementation QBUnifiedNativeImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.logoView.hidden = YES;
        [self addSubview:self.descLabel];
        [self addSubview:self.imageView];
        self.backgroundColor = [UIColor whiteColor];
        self.descLabel.frame = CGRectMake(0, 0, frame.size.width, descLabelHeight);
        self.imageView.frame = CGRectMake(0, (descLabelHeight+descLabel_to_imageView), frame.size.width, frame.size.width * 9.0 / 16.0);
    }
    return self;
}

//- (void)setupWithUnifiedNativeAdObject:(GDTUnifiedNativeAdDataObject *)unifiedNativeDataObject center:(QUBIADSdkCenter*)center rootViewController:(UIViewController *)rootViewController
- (void)setupWithUnifiedNativeAdObject:(GDTUnifiedNativeAdDataObject *)unifiedNativeDataObject center:(MYAdCenter*)center rootViewController:(UIViewController *)rootViewController
{
    //设置锚点controller
    self.viewController = rootViewController;
    
    //赋值
    self.descLabel.text = unifiedNativeDataObject.desc;
    [unifiedNativeDataObject bindImageViews:@[self.imageView] placeholder:nil];
    //绑定点击响应view
    [center my_registerDataObject:unifiedNativeDataObject view:self clickableViews:@[self.imageView] customClickableViews:@[]];
}

+(CGFloat)getViewHeightWithWidth:(CGFloat)width
{
    //图片宽高比为16：9
    CGFloat viewHeight = width * 9.0 / 16.0;
    
    //descLabel 高度为30
    CGFloat descLabelHeight1 = descLabelHeight;
    
    //descLabel 距离imageView 10；
    
    CGFloat descLabel_to_imageView1 = descLabel_to_imageView;
    
    //整个view的高度为
    return (viewHeight+descLabelHeight1+descLabel_to_imageView1);
    
    
}

#pragma mark - proerty getter

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (UILabel *)descLabel
{
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] init];
    }
    return _descLabel;
}



@end
