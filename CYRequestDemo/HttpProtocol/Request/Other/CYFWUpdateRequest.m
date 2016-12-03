//
//  CYDFURequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYFWUpdateRequest.h"

@implementation CYFWUpdateRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_DEVICE;
}

- (NSString *)functionName {
    return FUNCNAME_FWUPDATE;
}

- (NSString *)postURLParameters {
    return [NSString stringWithFormat:@"?uid=%lu",self.uid];
}

+ (instancetype)requestWithPostDictionary:(NSDictionary * )postDictionary {
    CYFWUpdateRequest *req = [[CYFWUpdateRequest alloc]init];
    req.postParameters = postDictionary;
    return req;
}
@end
