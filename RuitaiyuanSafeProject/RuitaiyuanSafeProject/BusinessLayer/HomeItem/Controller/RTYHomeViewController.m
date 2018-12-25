//
//  RTYHomeViewController.m
//  RuitaiyuanSafeProject
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#import "RTYHomeViewController.h"


#import "RTYLiveCallViewController.h"

#import "RTYUserLoginVC.h"


@interface RTYHomeViewController ()

@end

@implementation RTYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"push next" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 120, 44);
    button.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 180);
    [button addTarget:self action:@selector(actionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}


- (void)actionButtonPressed:(id)sender {
    
    
    //构造登录的主页面
    RTYUserLoginVC *loginvc = [[RTYUserLoginVC alloc] init];
    [self presentViewController:loginvc animated:YES completion:nil];
    

//    RTYLiveCallViewController *livevc = [RTYLiveCallViewController new];
//    [self.navigationController pushViewController:livevc animated:YES];
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
