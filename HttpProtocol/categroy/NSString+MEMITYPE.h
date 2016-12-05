//
//  NSString+MEMITYPE.h
//  CYRequestDemo
//
//  Created by CY on 2016/12/2.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MEMITYPE)
/**
 * 调用C语言的API来获得文件的MIMEType ，只能获取本地文件，无法获取网络请求来的文件
 */
- (NSString *)getMIMETypeWithCAPIAtFilePath:(NSString *)path;
@end
