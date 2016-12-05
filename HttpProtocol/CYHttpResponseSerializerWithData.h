//
//  CYHttpResponseSerializerWithData.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#define HTTP_RESPONSE_DATA     @"http_response_data"
/**
 *  扩展自AFHTTPResponseSerializer，用来处理AFNetworking处理服务器statecode=500错误时不将数据体传回的问题
 */
@interface CYHttpResponseSerializerWithData : AFHTTPResponseSerializer

@end
