//
//  CYSportsUploadRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYSportsUploadRequest.h"

@implementation CYSportsUploadRequest

- (NSString *)httpMethod {
    return POST;
}

- (NSString *)moduleName {
    return MODULENAME_SPORT;
}

- (NSString *)functionName {
    return FUNCNAME_UPLOAD_SPORTS;
}

- (NSString *)postURLParameters {
    return [NSString stringWithFormat:@"?uid=%lu",self.uid];
}

+ (instancetype)requestWithPostArray:(id )postArray {
    CYSportsUploadRequest *req = [[CYSportsUploadRequest alloc]init];
    req.postParameters = postArray;
    return req;
}
@end
