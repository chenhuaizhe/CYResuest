//
//  CYSportsDownloadRequest.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYBasicRequest.h"

@interface CYSportsDownloadRequest : CYBasicRequest
/**
 * 开始的日期 比如：20161128
 */
@property (nonatomic,copy)NSString *st;
/**
 * 开始日期后往前的天数 取值范围（0，30）
 */
@property (nonatomic,assign)NSUInteger ds;


/**
 *  便利构造器
 *
 *  @param start 开始的日期 20161128
 *  @param days 从开始天往前数的天数 （0，30）
 *
 */
+ (instancetype)requestWithDayStart:(NSString *)start
                          days:(NSUInteger)days;

@end
