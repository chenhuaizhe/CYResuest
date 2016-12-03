//
//  CYSleepUploadRequest.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYBasicRequest.h"

@interface CYSleepUploadRequest : CYBasicRequest
/**
 *  便利构造器
 *
 *  @param postArray Post的body体数组
 *
 */
+ (instancetype)requestWithPostArray:(NSArray *)postArray;

@end
