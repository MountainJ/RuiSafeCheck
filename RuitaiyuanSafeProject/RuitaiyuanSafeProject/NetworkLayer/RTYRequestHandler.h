//
//  RTYRequestHandler.h
//  RuitaiyuanSafeProject
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RTYNetWorkHosts.h"


NS_ASSUME_NONNULL_BEGIN

typedef void(^SuccessHandle)(id responseObject);

typedef void(^FailureHandle)(NSError * error);

@interface RTYRequestHandler : NSObject

+ (instancetype)sharedHandler;


- (void)getWithURLString:(NSString *)URLString successHandle:(SuccessHandle)success failureHandle:(FailureHandle)failure;

- (void)postWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters successHandle:(SuccessHandle)success failureHandle:(FailureHandle)failure;


@end

NS_ASSUME_NONNULL_END
