//
//  RTYRequestHandler.m
//  RuitaiyuanSafeProject
//
//  Created by 张毅 on 2018/11/1.
//  Copyright © 2018年 MountainJay. All rights reserved.
//

#import "RTYRequestHandler.h"

#import <AFNetworking/AFNetworking.h>


static NSTimeInterval kRequestOutTimeInterval = 15.;

@interface RTYRequestHandler ()

@property (nonatomic,strong) AFURLSessionManager *manager;

@end

@implementation RTYRequestHandler

+ (instancetype)sharedHandler
{
    static RTYRequestHandler *handler;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handler = [[self alloc] init];
    });
    return handler;
}

- (instancetype)init
{
    if (self = [super init]) {
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return self;
}

- (void)getWithURLString:(NSString *)URLString successHandle:(SuccessHandle)success failureHandle:(FailureHandle)failure
{
    NSURLRequest * request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:nil error:nil];
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            failure(error);
        } else {
            success(responseObject);
        }
    }];
    [dataTask resume];
}

- (void)postWithURLString:(NSString *)URLString parameters:(NSDictionary *)parameters successHandle:(SuccessHandle)success failureHandle:(FailureHandle)failure
{
    NSMutableURLRequest * request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:URLString parameters:parameters error:nil];
    request.timeoutInterval = kRequestOutTimeInterval;
    NSURLSessionDataTask *dataTask = [self.manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            failure(error);
        } else {
            success(responseObject);
        }
    }];
    [dataTask resume];
}

@end
