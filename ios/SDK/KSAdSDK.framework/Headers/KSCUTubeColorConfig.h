//
//  KSCUTubeColorConfig.h
//  KSAdSDK
//
//  Created by qingxu zhou on 2021/9/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KSCUTubeColorMode) {
    KSCUTubeColorModeNormalMode     = 0,            //正常模式
    KSCUTubeColorModeDarkMode       = 1,            //暗黑模式
    KSCUTubeColorModeFollowSystem   = 2,            //跟随系统
    KSCUTubeColorModeUserDefined    = 3,            //自定义
};

@interface KSCUTubeColorConfig : NSObject
@property (nonatomic, strong) UIColor *backgroundColor;             //背景色
@property (nonatomic, strong) UIColor *titleColor;                  //标题色
@property (nonatomic, strong) UIColor *subTitleColor;               //副标题色
@property (nonatomic, strong) UIColor *descriptionColor;            //描述文本颜色
@end

NS_ASSUME_NONNULL_END
