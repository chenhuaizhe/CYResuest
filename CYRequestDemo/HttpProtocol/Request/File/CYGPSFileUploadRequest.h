//
//  CYGPSFileUploadRequest.h
//  CYRequestDemo
//
//  Created by CY on 2016/12/2.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYBasicRequest.h"

@interface CYGPSFileUploadRequest : CYBasicRequest
/**
 *  便利构造器
 *
 *  @param fileName 文件名
 *  @param path 文件路径
 *
 */
+ (instancetype)requestWithFileName:(NSString *)fileName Path:(NSString *)path;

@end
