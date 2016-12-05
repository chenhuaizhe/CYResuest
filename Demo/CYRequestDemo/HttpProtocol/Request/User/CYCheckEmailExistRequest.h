//
//  CYCheckEmailExistRequest.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYBasicRequest.h"

@interface CYCheckEmailExistRequest : CYBasicRequest

/**
 * 注册邮箱
 */
@property (nonatomic,assign)NSString *email;


/**
 *  便利构造器
 *
 *  @param email 注册邮箱
 *
 */
+ (instancetype)requestWithEmail:(NSString *)email;

@end
