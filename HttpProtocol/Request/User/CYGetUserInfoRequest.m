//
//  CYGetUserInfoRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYGetUserInfoRequest.h"

@implementation CYGetUserInfoRequest
- (NSUInteger)uid {
    return 148049495113589032;
}

- (NSString *)httpMethod {
    return GET;
}

- (NSString *)moduleName {
    return MODULENAME_USER;
}

- (NSString *)functionName {
    return FUNCNAME_GET_USERINFO;
}
@end
