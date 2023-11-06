//
//  MYAdCenter.h
//  mySDK
//
//  Created by 凌锋晨 on 2021/9/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MYSplashAdData.h"
#import "MYInterActionAdData.h"
#import "MYBannerAdData.h"
#import "MYNativeAdData.h"
#import "MYRewardVideoAdData.h"
#import "MYDrawNativeVideoAdData.h"
#import "MYUnifiedAdData.h"
#import "MYContentStyleAdData.h"
#import "MYSaData.h"
#import "MYActiveAdData.h"
#import <WebKit/WebKit.h>
//#import "MYNewInterActionAdData.h"
#import "MYNewsAdData.h"
NS_ASSUME_NONNULL_BEGIN

@interface MYAdCenter : NSObject

#pragma mark 获取广告cpm的调用方法
//需要联系商务开启权限
//开屏广告、插屏广告和激励视频广告才能获取到，其余类型广告值为0
//需要在广告展示之后才有值。
//返回值单位为分，表示千次展示的价格(分)
-(int)myAdCPM;






#pragma mark 开屏广告
/***************开屏广告调用方法*******************/
/// 开屏广告调用
/// @param data 开屏广告Data
-(void) my_showSplashAd:(MYSplashAdData *)data;
/// 关闭开屏广告
-(void) my_closeSplashAd;







#pragma mark 插屏广告
/***************插屏广告调用方法*******************/
/// 插屏广告调用
-(void) my_showInterActionAd:(MYInterActionAdData *)data;



#pragma mark banner广告
/***************banner广告调用方法*******************/
-(void) my_showBannerAd:(MYBannerAdData *)data;
//移除banner广告
-(void)removeBannerAd;




#pragma mark 信息流广告广告
/***************信息流广告广告调用方法*******************/
/// 信息流广告广告调用
-(void) my_showNativeAd:(MYNativeAdData *)data;
//获取广告cell高度
- (CGFloat)my_heightForNativeAd:(id)adData;
//获取cell
- (UITableViewCell *)my_tableView:(UITableView *)tableView cellForForNativeAd:(id)adData IndexPath:(NSIndexPath *)indexPath;
//获取UICollectionViewCell
- (UICollectionViewCell *)my_collectionView:(UICollectionView *)collectionView cellForForNativeAd:(id)adData IndexPath:(NSIndexPath *)indexPath;
-(CGSize) my_collectionView:(UICollectionView *)acollectionView AndData:(id)data;



#pragma mark 激励视频广告
/***************激励视频广告调用方法*******************/
/// 激励视频广告调用,返回值为订单号
-(NSString *) my_showRewardVideoAd:(MYRewardVideoAdData *)data;
/// 显示激励视频广告
-(void) showRewardVideoAd;








#pragma mark draw竖版视频信息流广告
/***************draw竖版视频信息流广告调用方法*******************/
/// draw竖版视频信息流广告调用
-(void) my_showDrawNativeVideoAd:(MYDrawNativeVideoAdData *)data;
/// draw竖版视频信息流广告 获取广告UITableViewCell
/// @param tableView 显示的tableview
/// @param adData 广告数据
/// @param indexPath table的indexPath
/// @return UITableViewCell
- (UITableViewCell *)my_tableView:(UITableView *)tableView cellForForDrawVideoAd:(id)adData IndexPath:(NSIndexPath *)indexPath;
/// draw竖版视频信息流广告 获取广告UICollectionViewCell
/// @param collectionView 显示的UICollectionView
/// @param adData 广告数据
/// @param indexPath table的indexPath
/// @return UICollectionViewCell
- (UICollectionViewCell *)my_collectionView:(UICollectionView *)collectionView cellForForDrawVideoAd:(id)adData IndexPath:(NSIndexPath *)indexPath;

//**************仅支持部分广告源，调用之前请先和技术确认是否支持************************
//暂停视频，调用 pauseAd 后，需要被暂停的视频广告对象，不会再自动播放，需要调用 play 才能恢复播放。
- (void)pauseAd:(id)cell;

//**************仅支持部分广告源，调用之前请先和技术确认是否支持************************
//播放视频,视频暂停之后的继续播放。如果视频播放结束了，不能调用此接口重新播放(只能用户手动点重播)
- (void)playAd:(id)cell;





#pragma mark 信息流自渲染广告
/***************信息流自渲染广告调用方法*******************/
/// 请求信息流自渲染广告数据
-(void)my_requestUnifiedAd:(MYUnifiedAdData *)data;
///信息流自渲染广告视图注册
///@param dataObject 数据对象，必传字段
///@param clickableViews 可点击的视图数组，此数组内的广告元素才可以响应广告对应的点击事件
///@param customClickableViews 可点击的视图数组，与clickableViews的区别是：在视频广告中当dataObject中的videoConfig的detailPageEnable为YES时，点击后直接进落地页而非视频详情页，除此条件外点击行为与clickableViews保持一致
- (void)my_registerDataObject:(id)dataObject view:(UIView *)view clickableViews:(NSArray<UIView *> *)clickableViews customClickableViews:(NSArray <UIView *> *)customClickableViews;










#pragma mark 内容列表样式
/***************内容列表样式*******************/
-(void)my_showContentStyleAd:(MYContentStyleAdData *)data;
/**
 播放器外部控制能力,需要联系商务申请
* 媒体调用，控制当前视频启播或者恢复播放;
*/
- (void)resumeCurrentPlayer;

/**
 播放器外部控制能力,需要联系商务申请
* 媒体调用，控制当前视频暂停播放; 若在首个video起播前调用,视频不启播，若在视频播放过程中调用，视频转变为暂停播放状态。
*/
-  (void)pauseCurrentPlayer;

/*
 释放内容列表样式
*/
-(void) deallocContentStyleAd;


#pragma mark 资讯模块
/*资讯模块*/
-(void)my_loadNewsViewController:(MYNewsAdData*)data;



#pragma mark 互动模块
/***************互动模块*******************/
//获取互动模块controller
-(UIViewController *)getActiveViewCOntroller:(MYActiveAdData *)data;
//获取wkwebview
//controller 是getSaWebViewControllerWithData获取的controller
-(WKWebView*)getActiveWebViewWithController:(UIViewController *)controller;







#pragma mark 任务模块
/***************任务模块*******************/
//获取任务模块controller
-(UIViewController *)getSaWebViewControllerWithData:(MYSaData *)data;

@end

NS_ASSUME_NONNULL_END
