//
//  UIColor+RGB.h
//  CYRequestDemo
//
//  Created by CY on 2016/12/3.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RGB)
+ (UIColor *)colorFromCode:(int)hexCode inAlpha:(float)alpha;
@end
