//
//  CYWeightUploadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYWeightUploadRequest.h"

@implementation CYWeightUploadRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_SPORT;
}

- (NSString *)functionName {
    return FUNCNAME_UPLOAD_WEIGHT;
}

- (NSString *)postURLParameters {
    return [NSString stringWithFormat:@"?uid=%lu",self.uid];
}

+ (instancetype)requestWithPostArray:(id )postArray {
    CYWeightUploadRequest *req = [[CYWeightUploadRequest alloc]init];
    req.postParameters = postArray;
    return req;
}
@end
