//
//  CYGetPwdRequest.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYBasicRequest.h"

@interface CYGetPwdRequest : CYBasicRequest
/**
 *  便利构造器
 *
 *  @param postDictionary Post的body体
 *
 */
+ (instancetype)requestWithPostDictionary:(NSDictionary *)postDictionary;
@end
