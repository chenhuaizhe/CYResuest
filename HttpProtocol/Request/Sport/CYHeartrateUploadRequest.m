//
//  CYHeartrateUploadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYHeartrateUploadRequest.h"

@implementation CYHeartrateUploadRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_SPORT;
}

- (NSString *)functionName {
    return FUNCNAME_UPLOAD_HEARTRATE;
}

- (NSString *)postURLParameters {
    return [NSString stringWithFormat:@"?uid=%lu",self.uid];
}

+ (instancetype)requestWithPostArray:(id )postArray {
    CYHeartrateUploadRequest *req = [[CYHeartrateUploadRequest alloc]init];
    req.postParameters = postArray;
    return req;
}
@end
