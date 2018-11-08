//
//  RTYLiveCallViewController.m
//  RuitaiyuanSafeProject
//
//  Created by 张毅 on 2018/11/7.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#import "RTYLiveCallViewController.h"

#import <PLRTCStreamingKit/PLRTCStreamingKit.h>

#import <SVProgressHUD/SVProgressHUD.h>

@interface RTYLiveCallViewController ()<PLMediaStreamingSessionDelegate>

@property (nonatomic, strong) PLMediaStreamingSession *session;

@property (nonatomic,copy) NSString  *roomName;
@property (nonatomic,copy) NSString  *roomToken;
@property (nonatomic,copy) NSString  *usrId;



@end

@implementation RTYLiveCallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    self.title = @"通话";
    
    [SVProgressHUD show];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
    
    
    [self configData];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"start" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 44);
    button.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 80);
    [button addTarget:self action:@selector(actionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    

}

- (void)configData
{
    //
    /*
     
    self.roomName = @"rtytest001";
    self.roomToken = @"YlzitS2Q9HujWU6cvVCiW4stAS8fOETES-iaFWBO:DD-cwj1EPAXpO252emfpYxWx1ng=:eyJhcHBJZCI6ImR0amE3eWQ5OSIsInJvb21OYW1lIjoicnR5dGVzdDAwMSIsInVzZXJJZCI6ImExMjM0NTY3IiwiZXhwaXJlQXQiOjE1NDE3NTY2OTgsInBlcm1pc3Npb24iOiJ1c2VyIn0=";
    self.usrId = @"a1234567";
     */

    
    
    ////
    
    
    
    ////
    
    
    
    self.roomName = @"rtytest001";
    self.roomToken = @"YlzitS2Q9HujWU6cvVCiW4stAS8fOETES-iaFWBO:j_N7GKWqzGLIwHMglet-MAXSlUY=:eyJhcHBJZCI6ImR0amE3eWQ5OSIsInJvb21OYW1lIjoicnR5dGVzdDAwMSIsInVzZXJJZCI6ImExMjM0NTY3MDAwIiwiZXhwaXJlQXQiOjE1NDE3NTY2OTgsInBlcm1pc3Npb24iOiJ1c2VyIn0=";
    self.usrId = @"a1234567000";
    
    
    
    //PLMediaStreamingSession
    // Do any additional setup after loading the view, typically from a nib.
    PLVideoCaptureConfiguration *videoCaptureConfiguration = [PLVideoCaptureConfiguration defaultConfiguration];
    PLAudioCaptureConfiguration *audioCaptureConfiguration = [PLAudioCaptureConfiguration defaultConfiguration];
    PLVideoStreamingConfiguration *videoStreamingConfiguration = [PLVideoStreamingConfiguration defaultConfiguration];
    PLAudioStreamingConfiguration *audioStreamingConfiguration = [PLAudioStreamingConfiguration defaultConfiguration];
    
    self.session = [[PLMediaStreamingSession alloc] initWithVideoCaptureConfiguration:videoCaptureConfiguration audioCaptureConfiguration:audioCaptureConfiguration videoStreamingConfiguration:videoStreamingConfiguration audioStreamingConfiguration:audioStreamingConfiguration stream:nil];
    
     [self.session setWithServerRegionID:PLRTC_SERVER_REGION_DEFAULT serverRegionName:@""];
     self.session.delegate = self;
    
    
}


- (void)actionButtonPressed:(id)sender {
    
    
    [self.session setWithServerRegionID:PLRTC_SERVER_REGION_DEFAULT serverRegionName:@""];
    PLRTCConfiguration *configuration = [PLRTCConfiguration defaultConfiguration];
    [self.session startConferenceWithRoomName:self.roomName userID:self.usrId roomToken:self.roomToken rtcConfiguration:configuration];
    
    
//    [self.view addSubview:self.session.previewView];
//    //////
//    ///////初始化播放器
//    NSURL *pushURL = [NSURL URLWithString:@"http://www.baidu.com"];
//    [self.session startStreamingWithPushURL:pushURL feedback:^(PLStreamStartStateFeedback feedback) {
//        if (feedback == PLStreamStartStateSuccess) {
//            NSLog(@"Streaming started.");
//        }
//        else {
//            NSLog(@"Oops.");
//        }
//    }];
    
    
    
}


- (PLRTCVideoRender *)mediaStreamingSession:(PLMediaStreamingSession *)session    firstVideoFrameDecodedOfUserID:(NSString *)userID {
    
    
    PLRTCVideoView *remoteView = [[PLRTCVideoView alloc] initWithFrame:CGRectMake(0, 0, 108, 192)];
    remoteView.clipsToBounds = YES;
    [self.view addSubview:remoteView];
    
    PLRTCVideoRender *render = [[PLRTCVideoRender alloc] init];
    render.renderView = remoteView;
    
    //主播需要设置当前连麦者在合流画面的位置，此设置只对主播有效
    render.mixOverlayRect = CGRectMake(244, 448, 108, 192);
    return render;
}

- (void)mediaStreamingSession:(PLMediaStreamingSession *)session rtcDidFailWithError:(NSError *)error
{
    
}

- (void)mediaStreamingSession:(PLMediaStreamingSession *)session didDisconnectWithError:(NSError *)error
{
    
    //网络切换的连接处理
    session.connectionChangeActionCallback = ^(PLNetworkStateTransition transition) {
        switch (transition) {
            case PLNetworkStateTransitionWWANToWiFi:
                return YES;
                
            case PLNetworkStateTransitionWiFiToWWAN:
                return NO;
                
            default:
                break;
        }
        
        return NO;
    };

}

- (void)mediaStreamingSession:(PLMediaStreamingSession *)session streamStatusDidUpdate:(PLStreamStatus *)status
{
    
}

- (void)mediaStreamingSession:(PLMediaStreamingSession *)session rtcStateDidChange:(PLRTCState)state
{
    
}

/// @abstract  userID 加入房间
- (void)mediaStreamingSession:(PLMediaStreamingSession *)session didJoinConferenceOfUserID:(NSString *)userID
{
    
}

/// @abstract userID 离开房间
- (void)mediaStreamingSession:(PLMediaStreamingSession *)session didLeaveConferenceOfUserID:(NSString *)userID
{
    
}






/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
