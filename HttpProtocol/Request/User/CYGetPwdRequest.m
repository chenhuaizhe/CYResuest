
//
//  CYGetPwdRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYGetPwdRequest.h"

@implementation CYGetPwdRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_USER;
}

- (NSString *)functionName {
    return FUNCNAME_GET_PWD;
}

+ (instancetype)requestWithPostDictionary:(NSDictionary *)postDictionary {
    CYGetPwdRequest *req = [[CYGetPwdRequest alloc]init];
    req.postParameters = postDictionary;
    return req;
}
@end
