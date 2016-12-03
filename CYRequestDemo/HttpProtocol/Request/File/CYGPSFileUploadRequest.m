//
//  CYGPSFileUploadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/12/2.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYGPSFileUploadRequest.h"

@implementation CYGPSFileUploadRequest
- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_FILE;
}

- (NSString *)functionName {
    return FUNCNAME_UPLOAD_FILE_GPS;
}

- (NSString *)postURLParameters {
    return [NSString stringWithFormat:@"?uid=%lu",self.uid];
}

+ (instancetype)requestWithFileName:(NSString *)fileName Path:(NSString *)path {
    CYGPSFileUploadRequest *req = [[CYGPSFileUploadRequest alloc]init];
    req.fileName = fileName;
    req.path = path;
    return req;

}

@end
