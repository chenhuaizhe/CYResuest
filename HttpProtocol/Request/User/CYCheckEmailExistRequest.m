//
//  CYCheckEmailExistRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYCheckEmailExistRequest.h"

@implementation CYCheckEmailExistRequest

- (NSString *)httpMethod {
    return GET;
}

- (NSString *)moduleName {
    return MODULENAME_USER;
}

- (NSString *)functionName {
    return FUNCNAME_CHECK_EMAIL;
}

-  (NSArray *)ignoreKeys {
    return @[@"uid"];
}

+ (instancetype)requestWithEmail:(NSString *)email{
    CYCheckEmailExistRequest *req = [[CYCheckEmailExistRequest alloc]init];
    req.email = email;
    return req;
}
@end
