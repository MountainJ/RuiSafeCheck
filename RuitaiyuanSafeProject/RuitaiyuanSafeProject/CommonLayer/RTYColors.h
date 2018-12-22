//
//  RTYColors.h
//  RuitaiyuanSafeProject
//
//  Created by 张毅 on 2018/11/7.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#ifndef RTYColors_h
#define RTYColors_h


// COLOR
#ifndef COLOR_FROM_RGB
#define COLOR_FROM_RGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]
#endif

#ifndef COLOR_FROM_ARGB
#define COLOR_FROM_ARGB(argbValue) [UIColor colorWithRed:((float)(((argbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((argbValue) & 0xFF00) >> 8))/255.0 blue:((float)((argbValue) & 0xFF))/255.0 alpha:((float)(((argbValue) & 0xFF000000) >> 24))/255.0]
#endif

#ifndef COLOR_FROM_RGBA
#define COLOR_FROM_RGBA(rgbValue, nAlpha) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:(nAlpha)]
#endif

//UI COLOR

//状态栏，导航栏的背景颜色
#define COLOR_STATUS_NAV_BAR_BACK   [UIColor colorWithRed:4.0/255 green:145.0/255 blue:218.0/255 alpha:1]

//浅色背景
#define COLOR_LIGHTGRAY_BACK   [UIColor colorWithRed:246.0/255 green:246.0/255 blue:246.0/255 alpha:1]



#endif /* RTYColors_h */
