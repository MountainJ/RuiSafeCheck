//
//  RTYCollectorHomeVC.m
//  RuitaiyuanSafeProject
//
//  Created by Jayzy on 2018/12/12.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#import "RTYCollectorHomeVC.h"

@interface RTYCollectorHomeVC ()

@end

@implementation RTYCollectorHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    self.title = @"采集员的首页";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"采集员首页采集" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 180, 44);
    button.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds) - 180);
    [self.view addSubview:button];
    
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
