//
//  RTYUserLoginVC.m
//  RuitaiyuanSafeProject
//
//  Created by Jayzy on 2018/12/11.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#import "RTYUserLoginVC.h"

#import "AppDelegate.h"
#import "RTYTabbarController.h"
#import "RTYCollectorHomeVC.h"


@interface RTYUserLoginVC ()

@end

@implementation RTYUserLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"登陆 看看" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 120, 44);
    button.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 180);
    [button addTarget:self action:@selector(loginPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)loginPressed
{
    if (self.presentingViewController!=nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    
    //登陆业主端的主界面
//    RTYTabbarController *tabbar = [[RTYTabbarController alloc] init];
//    [self restoreRootViewController:tabbar];
    //
    //登陆采集员的主界面
    RTYCollectorHomeVC *collectorvc = [[RTYCollectorHomeVC alloc] init];
    [self restoreRootViewController:collectorvc];
}

// 登陆后淡入淡出更换rootViewController
- (void)restoreRootViewController:(UIViewController *)rootViewController
{
    typedef void (^Animation)(void);
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];
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
