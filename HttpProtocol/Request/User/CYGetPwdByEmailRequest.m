//
//  CYGetPwdByEmailRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYGetPwdByEmailRequest.h"

@implementation CYGetPwdByEmailRequest
- (NSString *)httpMethod {
    return GET;
}

- (NSString *)moduleName {
    return MODULENAME_USER;
}

- (NSString *)functionName {
    return FUNCNAME_GET_PWD_BY_EMAIL;
}

-  (NSArray *)ignoreKeys {
    return @[@"uid"];
}

+ (instancetype)requestWithEmail:(NSString *)email{
    CYGetPwdByEmailRequest *req = [[CYGetPwdByEmailRequest alloc]init];
    req.email = email;
    return req;
}

@end
