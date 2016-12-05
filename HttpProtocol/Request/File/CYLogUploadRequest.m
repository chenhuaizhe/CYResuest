//
//  CYLogUploadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYLogUploadRequest.h"

@implementation CYLogUploadRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_FILE;
}

- (NSString *)functionName {
    return FUNCNAME_UPLOAD_LOG;
}

- (NSString *)postURLParameters {
    return [NSString stringWithFormat:@"?uid=%lu",self.uid];
}

+ (instancetype)requestWithFileName:(NSString *)fileName Path:(NSString *)path PostDictionary:(NSDictionary *)postDictionary {
    CYLogUploadRequest *req = [[CYLogUploadRequest alloc]init];
    req.fileName = fileName;
    req.path = path;
    req.postParameters = postDictionary;
    return req;
}
@end
