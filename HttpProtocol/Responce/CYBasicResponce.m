//
//  CYBasicResponce.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYBasicResponce.h"

@implementation CYBasicResponce

- (NSString *)description{
    
    NSString *desc = [NSString stringWithFormat:@"%@",[self mj_keyValues]];
    return desc;
}

@end
