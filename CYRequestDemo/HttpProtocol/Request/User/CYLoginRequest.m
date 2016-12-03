//
//  CYLoginRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYLoginRequest.h"

@implementation CYLoginRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_USER;
}

- (NSString *)functionName {
    return FUNCNAME_LOGIN;
}

+ (instancetype)requestWithPostDictionary:(NSDictionary *)postDictionary {
    CYLoginRequest *req = [[CYLoginRequest alloc]init];
    req.postParameters = postDictionary;
    return req;
}
@end
