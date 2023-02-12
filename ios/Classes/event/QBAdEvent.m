//
//  QBAdEvent.m
//  quakerbirdad
//
//  Created by gstory on 2023/2/9.
//

#import "QBAdEvent.h"
#import <Flutter/Flutter.h>

@interface QBAdEvent()<FlutterStreamHandler>
@property(nonatomic,strong) FlutterEventSink eventSink;
@end

@implementation QBAdEvent
+ (instancetype)sharedInstance{
    static QBAdEvent *myInstance = nil;
    if(myInstance == nil){
        myInstance = [[QBAdEvent alloc]init];
    }
    return myInstance;
}


- (void)initEvent:(NSObject<FlutterPluginRegistrar>*)registrar{
    FlutterEventChannel *eventChannel = [FlutterEventChannel eventChannelWithName:@"com.gstory.quakerbirdad/adevent"   binaryMessenger:[registrar messenger]];
    [eventChannel setStreamHandler:self];
}

-(void)sentEvent:(NSDictionary*)arguments{
    self.eventSink(arguments);
}



#pragma mark - FlutterStreamHandler
- (FlutterError * _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    self.eventSink = nil;
    return nil;
}

- (FlutterError * _Nullable)onListenWithArguments:(id _Nullable)arguments eventSink:(nonnull FlutterEventSink)events {
    self.eventSink = events;
    return nil;
}

@end
