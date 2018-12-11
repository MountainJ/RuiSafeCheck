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


@interface RTYTabbarController ()

@end

@implementation RTYTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creatAddVC:[RTYHomeViewController new] title:@"首页" imgName:nil];
    [self creatAddVC:[RTYMineViewController new] title:@"我的" imgName:nil];
    

    
    //设置默认字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor darkGrayColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:19.],NSFontAttributeName, nil] forState:UIControlStateNormal];
    //设置选中字体颜色
    UIColor *titleHighlightedColor = [UIColor orangeColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: titleHighlightedColor, NSForegroundColorAttributeName,[UIFont systemFontOfSize:19.],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    
 
}


- (void)creatAddVC:(UIViewController *)vc title:(NSString *)title imgName:(NSString *)imgName{
    
    vc.title = title;
    if (imgName) {
        vc.tabBarItem.image = [[UIImage imageNamed:imgName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        NSString *selImgName = [NSString stringWithFormat:@"%@_sel",imgName];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImgName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
   
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];
   
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
