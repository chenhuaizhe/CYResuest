//
//  CYIconUploadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYIconUploadRequest.h"

@implementation CYIconUploadRequest

- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_FILE;
}

- (NSString *)functionName {
    return FUNCNAME_UPLOAD_ICON;
}

- (NSString *)postURLParameters {
    return [NSString stringWithFormat:@"?uid=%lu",self.uid];
}

+ (instancetype)requestWithFileName:(NSString *)fileName Icon:(UIImage *)icon{
    CYIconUploadRequest *req = [[CYIconUploadRequest alloc]init];
    req.fileName = fileName;
    req.icon = icon;
    return req;
}


@end
