//
//  CYHttpResponseSerializerWithData.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYHttpResponseSerializerWithData.h"



@implementation CYHttpResponseSerializerWithData

/**
 *  重写基类方法，如果服务器返回错误代码，且带有业务数据体，则将数据体添加到错误对象中
 *
 *  @param response 响应
 *  @param data     数据
 *  @param error    错误
 *
 */
- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        if (*error != nil && data != nil) {
            NSMutableDictionary* userInfo = [NSMutableDictionary dictionaryWithDictionary:[*error userInfo]];
            [userInfo setObject:data forKey:HTTP_RESPONSE_DATA];
            *error = [NSError errorWithDomain:(*error).domain code:(*error).code userInfo:userInfo];
        }
        
        return data;
    }
    
    return ([super responseObjectForResponse:response data:data error:error]);
}

@end
