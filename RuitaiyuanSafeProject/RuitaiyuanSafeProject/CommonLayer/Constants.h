//
//  Constants.h
//  RuitaiyuanSafeProject
//
//  Created by 张毅 on 2018/11/7.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

/////================常用变量

// String
#ifndef SAFE_STRING
#define SAFE_STRING(string) ((string)?(string):@"")
#endif


// SCREEN
#ifndef SCREEN_WIDTH
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#endif
#ifndef SCREEN_HEIGHT
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#endif

// Device
#ifndef IS_IPHONE
#define IS_IPHONE   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#endif
#ifndef IS_IPAD
#define IS_IPAD   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#endif

// iPad 9.7  1024 * 768 iPhone 6 375*667
#ifndef iPadViewScale
#define iPadViewScale(px) ((SCREEN_WIDTH > SCREEN_HEIGHT) ? iPadViewLandscapeScale(px) : iPadViewPortraitScale(px))
#endif
// iPad 竖版适配
#ifndef iPadViewPortraitScale
#define iPadViewPortraitScale(px) (((SCREEN_WIDTH < SCREEN_HEIGHT) ? SCREEN_WIDTH : SCREEN_HEIGHT)/768.0 * (px))
#endif
// iPad 横版适配
#ifndef iPadViewLandscapeScale
#define iPadViewLandscapeScale(px) (((SCREEN_WIDTH > SCREEN_HEIGHT) ? SCREEN_WIDTH : SCREEN_HEIGHT)/1024.0 * (px))
#endif

// iPhone 适配
#ifndef iPhoneViewScale
#define iPhoneViewScale(px) ((SCREEN_WIDTH > SCREEN_HEIGHT) ? iPhoneViewLandscapeScale(px) : iPhoneViewPortraitScale(px))
#endif
// iPhone 竖版适配
#ifndef iPhoneViewPortraitScale
#define iPhoneViewPortraitScale(px) (((SCREEN_WIDTH < SCREEN_HEIGHT) ? SCREEN_WIDTH : SCREEN_HEIGHT)/375.0 * (px))
#endif
// iPhone 横版适配
#ifndef iPhoneViewLandscapeScale
#define iPhoneViewLandscapeScale(px) (((SCREEN_WIDTH > SCREEN_HEIGHT) ? SCREEN_WIDTH : SCREEN_HEIGHT)/667.0 * (px))
#endif

// SystemVersion
#ifndef SYSTEM_VERSION
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#endif

// Window
#ifndef APPDELEGATE_WINDOW
#define APPDELEGATE_WINDOW [[UIApplication sharedApplication].delegate window]
#endif




// Weak/Strong self
#ifndef WEAKIFY
#if DEBUG
#if __has_feature(objc_arc)
#define WEAKIFY(object) __weak __typeof__(object) weak##_##object = object;
#else
#define WEAKIFY(object) __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define WEAKIFY(object) @try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define WEAKIFY(object) @try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef STRONGIFY
#if DEBUG
#if __has_feature(objc_arc)
#define STRONGIFY(object) __typeof__(object) object = weak##_##object;
#else
#define STRONGIFY(object) __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define STRONGIFY(object) @try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define STRONGIFY(object) @try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif




//日志输出
#ifdef DEBUG
#define NSLog(format, ...) printf("文件: <%s> %.4d行 日志: %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])
#else
#define NSLog(...)
#endif





//////===============================第三方业务key============
//七牛云视频通话的appkey
#define  RTY_APP_VIDEOSHOW_KEY              @"dtja7yd99"



#endif /* Constants_h */
