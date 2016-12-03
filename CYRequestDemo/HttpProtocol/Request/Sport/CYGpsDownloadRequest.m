//
//  CYGpsDownloadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYGpsDownloadRequest.h"

@implementation CYGpsDownloadRequest
- (NSString *)httpMethod {
    return GET;
}

- (NSString *)moduleName {
    return MODULENAME_SPORT;
}

- (NSString *)functionName {
    return FUNCNAME_DOWNLOAD_GPS;
}

+ (instancetype)requestWithDayStart:(NSString *)start days:(NSUInteger )days {
    CYGpsDownloadRequest *req = [[CYGpsDownloadRequest alloc]init];
    req.st = start;
    req.ds = days;
    return req;
}

@end
