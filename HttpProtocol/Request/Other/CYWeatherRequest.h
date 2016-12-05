//
//  CYWeatherRequest.h
//  CYRequestDemo
//
//  Created by CY on 2016/12/3.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYBasicRequest.h"

@interface CYWeatherRequest : CYBasicRequest
/**
 * 经度
 */
@property (nonatomic, assign)CGFloat lat;
/**
 * 纬度
 */
@property (nonatomic, assign)CGFloat lon;
/**
 * 城市
 */
@property (nonatomic, copy) NSString *city;


/**
 *  便利构造器
 *
 *
 */
+ (instancetype)requestWithLatitude:(CGFloat)lat
                          longitude:(CGFloat)lon
                               city:(NSString *)city;

@end
