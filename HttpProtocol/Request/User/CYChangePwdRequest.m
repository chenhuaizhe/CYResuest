//
//  CYChangePwdRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYChangePwdRequest.h"

@implementation CYChangePwdRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_USER;
}

- (NSString *)functionName {
    return FUNCNAME_CHANGE_PWD;
}

+ (instancetype)requestWithPostDictionary:(NSDictionary *)postDictionary {
    CYChangePwdRequest *req = [[CYChangePwdRequest alloc]init];
    req.postParameters = postDictionary;
    return req;
}
@end
