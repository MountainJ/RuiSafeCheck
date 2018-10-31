//
//  ViewController.m
//  RuitaiyuanSafeProject
//
//  Created by 张毅 on 2018/10/27.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#import "ViewController.h"

#import <AFNetworking.h>

#import <PLRTCStreamingKit/PLRTCStreamingKit.h>


@interface ViewController ()

@property (nonatomic, strong) PLMediaStreamingSession *session;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"start" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 44);
    button.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 80);
    [button addTarget:self action:@selector(actionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}

- (void)actionButtonPressed:(id)sender {
    
    
    // Do any additional setup after loading the view, typically from a nib.
    PLVideoCaptureConfiguration *videoCaptureConfiguration = [PLVideoCaptureConfiguration defaultConfiguration];
    PLAudioCaptureConfiguration *audioCaptureConfiguration = [PLAudioCaptureConfiguration defaultConfiguration];
    PLVideoStreamingConfiguration *videoStreamingConfiguration = [PLVideoStreamingConfiguration defaultConfiguration];
    PLAudioStreamingConfiguration *audioStreamingConfiguration = [PLAudioStreamingConfiguration defaultConfiguration];
    
    self.session = [[PLMediaStreamingSession alloc] initWithVideoCaptureConfiguration:videoCaptureConfiguration audioCaptureConfiguration:audioCaptureConfiguration videoStreamingConfiguration:videoStreamingConfiguration audioStreamingConfiguration:audioStreamingConfiguration stream:nil];
    
    
    [self.view addSubview:self.session.previewView];

    //////
    ///////初始化播放器
    
    
    NSURL *pushURL = [NSURL URLWithString:@"http://www.baidu.com"];
    [self.session startStreamingWithPushURL:pushURL feedback:^(PLStreamStartStateFeedback feedback) {
        if (feedback == PLStreamStartStateSuccess) {
            NSLog(@"Streaming started.");
        }
        else {
            NSLog(@"Oops.");
        }
    }];
}


@end
