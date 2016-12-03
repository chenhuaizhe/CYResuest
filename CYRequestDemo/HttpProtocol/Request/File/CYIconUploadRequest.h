//
//  CYIconUploadRequest.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYBasicRequest.h"

@interface CYIconUploadRequest : CYBasicRequest
/**
 *  便利构造器
 *
 *  @param fileName 上传到服务器的文件名
 *  @param icon 头像
 *
 */
+ (instancetype)requestWithFileName:(NSString *)fileName Icon:(UIImage *)icon;

@end
