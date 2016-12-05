//
//  InfoLabel.m
//  CYRequestDemo
//
//  Created by CY on 2016/12/2.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "InfoLabel.h"
#import "CYHttpProtocolDef.h"
#import "CommonDefHeader.h"
#import "CYHTTPManager.h"

@implementation InfoLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    NSString *urlString = [CYHTTPManager urlInfoDecription];
    NSString *info = [NSString stringWithFormat:@"User Module:%@\nSport Module:%@\nDevice Module:%@\nFile Module:%@\nWeather Module:%@\n\n\n %@\n\n\nVersion:0.1 ",MODULENAME_USER,MODULENAME_SPORT,MODULENAME_DEVICE,MODULENAME_FILE,MODULENAME_WEATHER,urlString];
    self.text = info;
    [self sizeToFit];
}


@end
