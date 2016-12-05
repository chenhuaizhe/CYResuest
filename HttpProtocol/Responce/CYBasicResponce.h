//
//  CYBasicResponce.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>

/**
 *  服务器状态码定义
 */
typedef NS_ENUM(NSInteger, CYHTTPResponseCode) {
    CYHTTPResponseCodeSuccess = 0,   //成功
};

/**
 *  数据请求响应基类
 */
@interface CYBasicResponce : NSObject

/**
 * 状态码
 */
@property (nonatomic,assign) CYHTTPResponseCode retCode;


@end
