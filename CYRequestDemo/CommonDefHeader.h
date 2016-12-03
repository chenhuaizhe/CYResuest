//
//  CommonDefHeader.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/29.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#ifndef CommonDefHeader_h
#define CommonDefHeader_h

//屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//全局颜色
#define GLOBAL_COLOR [UIColor colorFromCode:0xff0066 inAlpha:1.0]

// 通知
#define NOTIFICATION_RESPONCE_GET @"got_responce"


#import "NSString+MEMITYPE.h"
#import "UIColor+RGB.h"


//用userdefault保存 url 的 key

#define LocalBaseUrl    @"BASE_URL"
#define LocalUserUrl    @"USER_URL"
#define LocalSportUrl   @"SPORT_URL"
#define LocalDeviceUrl  @"DEVICE_URL"
#define LocalFileUrl    @"FILE_URL"
#define LocalWeatherUrl @"WEATHER_URL"

#endif /* CommonDefHeader_h */
