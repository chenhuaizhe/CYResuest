//
//  CYHrHourUploadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYHrHourUploadRequest.h"

@implementation CYHrHourUploadRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_SPORT;
}

- (NSString *)functionName {
    return FUNCNAME_UPLOAD_HRHOURS;
}

- (NSString *)postURLParameters {
    return [NSString stringWithFormat:@"?uid=%lu",self.uid];
}

+ (instancetype)requestWithPostArray:(id )postArray {
    CYHrHourUploadRequest *req = [[CYHrHourUploadRequest alloc]init];
    req.postParameters = postArray;
    return req;
}
@end
