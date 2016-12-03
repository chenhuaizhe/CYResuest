//
//  CYRegsterRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYRegisterRequest.h"

@implementation CYRegisterRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_USER;
}

- (NSString *)functionName {
    return FUNCNAME_REGISTER;
}

+ (instancetype)requestWithPostDictionary:(NSDictionary *)postDictionary {
    CYRegisterRequest *req = [[CYRegisterRequest alloc]init];
    req.postParameters = postDictionary;
    return req;
}
@end
