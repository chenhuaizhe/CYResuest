//
//  CYWeatherRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/12/3.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYWeatherRequest.h"

@implementation CYWeatherRequest
- (NSString *)httpMethod {
    return GET;
}

- (NSString *)moduleName {
    return MODULENAME_WEATHER;
}

- (NSString *)functionName {
    return FUNCNAME_WEATHER;
}

- (NSArray *)ignoreKeys {
    return @[UID];
}

+ (instancetype)requestWithLatitude:(CGFloat)lat
                          longitude:(CGFloat)lon
                               city:(NSString *)city{
    CYWeatherRequest *req = [[CYWeatherRequest alloc]init];
    req.lat = lat;
    req.lon = lon;
    req.city = city;
    return req;
}
@end
