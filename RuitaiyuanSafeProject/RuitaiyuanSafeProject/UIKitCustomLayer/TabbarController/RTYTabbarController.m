//
//  RTYTabbarController.m
//  RuitaiyuanSafeProject
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#import "RTYTabbarController.h"

#import "RTYHomeViewController.h"
#import "RTYMineViewController.h"
#import "RTYSolvedHomeController.h"


@interface RTYTabbarController ()

@end

@implementation RTYTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatAddVC:[RTYHomeViewController new] title:@"首页" imgName:nil];
    [self creatAddVC:[RTYSolvedHomeController new] title:@"已解决" imgName:nil];
    [self creatAddVC:[RTYMineViewController new] title:@"我的" imgName:nil];
    

    
   
    
 
}


- (UIViewController *)creatAddVC:(UIViewController *)vc title:(NSString *)title imgName:(NSString *)imgName{
    
    vc.title = title;
    if (imgName) {
        vc.tabBarItem.image = [[UIImage imageNamed:imgName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        NSString *selImgName = [NSString stringWithFormat:@"%@_sel",imgName];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImgName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    vc.tabBarItem.title = title;
//    NSDictionary *dictTitleSel = [NSDictionary dictionaryWithObjectsAndKeys: [UIColor blueColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:17.],NSFontAttributeName, nil];
//    NSDictionary *dictTitleNor = [NSDictionary dictionaryWithObjectsAndKeys: [UIColor lightGrayColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:17.],NSFontAttributeName, nil];
//    [vc.tabBarItem setTitleTextAttributes:dictTitleSel forState:UIControlStateSelected];//设置选中字体颜色
//    [vc.tabBarItem setTitleTextAttributes:dictTitleNor forState:UIControlStateNormal];//设置默认字体颜色
    if (!IS_PHONEX_SERIER) {
        vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -4);
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    }

    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor lightGrayColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:17.],NSFontAttributeName, nil] forState:UIControlStateNormal];

    UIColor *titleHighlightedColor = [UIColor blueColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: titleHighlightedColor, NSForegroundColorAttributeName,[UIFont systemFontOfSize:17.],NSFontAttributeName,nil] forState:UIControlStateSelected];

    
    //tabbar 背景颜色
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
    

    
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
    return vc;
}


//改变tabbar高度
//- (void)viewWillLayoutSubviews{
//
//    CGRect tabFrame = self.tabBar.frame;
//    tabFrame.size.height = 49.;
//    tabFrame.origin.y = self.view.frame.size.height - 49. ;
//    self.tabBar.frame = tabFrame;
//}

@end
