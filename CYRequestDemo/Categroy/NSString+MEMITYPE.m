//
//  NSString+MEMITYPE.m
//  CYRequestDemo
//
//  Created by CY on 2016/12/2.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "NSString+MEMITYPE.h"
#import <MobileCoreServices/UTType.h>

@implementation NSString (MEMITYPE)

//调用C语言的API来获得文件的MIMEType ，只能获取本地文件哦，无法获取网络请求来的文件
- (NSString *)getMIMETypeWithCAPIAtFilePath:(NSString *)path
{
    if (![[[NSFileManager alloc] init] fileExistsAtPath:path]) {
        return nil;
    }
    
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[path pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *)(MIMEType);
}

@end
