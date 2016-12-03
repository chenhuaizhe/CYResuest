//
//  CYSportsDownloadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYSportsDownloadRequest.h"

@implementation CYSportsDownloadRequest

- (NSString *)httpMethod {
    return GET;
}

- (NSString *)moduleName {
    return MODULENAME_SPORT;
}

- (NSString *)functionName {
    return FUNCNAME_DOWNLOAD_SPORTS;
}

+ (instancetype)requestWithDayStart:(NSString *)start days:(NSUInteger )days {
    CYSportsDownloadRequest *req = [[CYSportsDownloadRequest alloc]init];
    req.st = start;
    req.ds = days;
    return req;
}

@end
