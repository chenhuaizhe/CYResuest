//
//  CYWalkingDownloadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYWalkingDownloadRequest.h"

@implementation CYWalkingDownloadRequest

- (NSString *)httpMethod {
    return GET;
}

- (NSString *)moduleName {
    return MODULENAME_SPORT;
}

- (NSString *)functionName {
    return FUNCNAME_DOWNLOAD_WALKING;
}

+ (instancetype)requestWithDayStart:(NSString *)start days:(NSUInteger )days {
    CYWalkingDownloadRequest *req = [[CYWalkingDownloadRequest alloc]init];
    req.st = start;
    req.ds = days;
    return req;
}

@end
