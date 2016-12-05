//
//  CYUpdateUserInfoRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYUpdateUserInfoRequest.h"

@implementation CYUpdateUserInfoRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_USER;
}

- (NSString *)functionName {
    return FUNCNAME_UPDATE_USERINFO;
}

+ (instancetype)requestWithPostDictionary:(NSDictionary *)postDictionary {
    CYUpdateUserInfoRequest *req = [[CYUpdateUserInfoRequest alloc]init];
    req.postParameters = postDictionary;
    return req;
}
@end
