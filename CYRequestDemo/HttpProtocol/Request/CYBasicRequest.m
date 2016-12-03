//
//  CYBasicRequest.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYBasicRequest.h"
#import <MJExtension.h>

@implementation CYBasicRequest

- (instancetype)init{
    if (self = [super init]) {
        [self setUid:144644799476738229];
    }
    return  self;
}

#pragma mark - Getter
- (NSString *)httpMethod{
    return GET;
}

- (NSString *)postURLParameters {
    return @"";
}

/**
 * 构造 Parameters ,GET 返回的是参数字典，POST返回的是POST的body体字典／数组，上传头像/GPS File 时返回nil
 */
- (id)getParameters {
    if ([self.functionName isEqualToString: FUNCNAME_UPLOAD_ICON]||[self.functionName isEqualToString: FUNCNAME_UPLOAD_FILE_GPS]) {
        return nil;
    }
    
    if (self.httpMethod == POST) {
        return self.postParameters;
    }
    NSMutableArray *array = @[HTTP_METHOD,MODULE_NAME,FUNCTION_NAME,IGNORE_KEYS,REPLACE_KEYS,POST_PARAMETERS,POST_URL_PARAMETERS,FILENAME,PATH,ICON].mutableCopy;
    
    if (self.ignoreKeys) {
        [array addObjectsFromArray:self.ignoreKeys];
    }
    //模型 -> 字典
    NSMutableDictionary *para = [self mj_keyValuesWithIgnoredKeys:array];
    //替换
    para = [self needReplaceKeys:para];
    
    return  para;
}

#pragma mark - 替换键值
- (NSMutableDictionary *)needReplaceKeys:(NSMutableDictionary *)para{
    
    if (self.replaceKeys) {
        
        for (NSString *key in self.replaceKeys.allKeys) {
            [para setObject:para[key] forKey:self.replaceKeys[key]];
            [para removeObjectForKey:key];
        }
        
    }
    return para;
}

#pragma mark - 描述
- (NSString *)description{
    if ([self.moduleName isEqualToString:MODULENAME_FILE]) {
        return [NSString stringWithFormat:@"{\nhttpMethod=%@\nmoduleName=%@\nfunctionName=%@\npostParameters=%@\n}\n",self.httpMethod,self.moduleName,self.functionName,self.postParameters];
    }

    NSMutableArray *array = @[IGNORE_KEYS,REPLACE_KEYS].mutableCopy;
    
    if (self.ignoreKeys) {
        [array addObjectsFromArray:self.ignoreKeys];
    }
    
    //模型 -> 字典
    NSMutableDictionary *para = [self mj_keyValuesWithIgnoredKeys:array];
    //替换
    para = [self needReplaceKeys:para];
    
    NSString *desc = [NSString stringWithFormat:@"%@",para];
    
    return desc;
}


@end
