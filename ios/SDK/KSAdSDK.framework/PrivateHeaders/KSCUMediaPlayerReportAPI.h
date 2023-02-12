//
//  KSCUMediaPlayerReportAPI.h
//  Pods
//
//  Created by jie cai on 2020/7/20.
//
#import <KSUNetworking/KSAdBaseAPI.h>
#import <KSUNetworking/KSAdBaseResponse.h>
#import <Bolts/Bolts.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSCUMediaPlayerReportResponse : KSAdBaseResponse

// 下次上传间隔，单位秒
@property (nonatomic, assign) uint64_t interval;

@end

@interface KSCUMediaPlayerReportAPI : KSAdBaseAPI

- (BFTask<KSCUMediaPlayerReportResponse *> *)sendLogs:(NSArray<NSDictionary *> *)logs;

@end

NS_ASSUME_NONNULL_END
