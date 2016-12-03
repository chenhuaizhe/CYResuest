//
//  CYBasicRequest.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYHttpProtocolDef.h"
#import <UIKit/UIKit.h>

static NSString *const  UID = @"uid";


//请求方式
static NSString *const  POST = @"http_post";
static NSString *const  GET = @"http_get";

//自定义参数
static NSString *const  HTTP_METHOD = @"httpMethod";
static NSString *const  MODULE_NAME = @"moduleName";
static NSString *const  FUNCTION_NAME = @"functionName";
static NSString *const  IGNORE_KEYS = @"ignoreKeys";
static NSString *const  REPLACE_KEYS = @"replaceKeys";
static NSString *const  POST_PARAMETERS = @"postParameters";
static NSString *const  POST_URL_PARAMETERS = @"postURLParameters";
static NSString *const  FILENAME = @"fileName";
static NSString *const  PATH = @"path";
static NSString *const  ICON = @"icon";

/**
 *  数据请求对象基类
 */
@interface CYBasicRequest : NSObject

/**
 *  用户id  即userId
 */
@property (nonatomic, assign) NSUInteger uid;

/**
 *  Http请求方法（POST、GET）
 */
@property (nonatomic, readonly) NSString* httpMethod;

/**
 *  模块名（子类必须覆盖）
 */
@property (nonatomic, readonly)NSString* moduleName;
/**
 *  方法接口名（子类必须覆盖）
 */
@property (nonatomic, readonly)NSString* functionName;
/**
 *  POST方式时的参数数组/字典，POST时子类必须对其赋值（POST时子类必须赋值）
 */
@property (nonatomic, strong) id postParameters;

/**
 *  POST方式时的 URL Params 字符串，默认为@""
 */
@property (nonatomic, strong) NSString *postURLParameters;

/**
 *  忽略的参数
 */
@property (nonatomic, strong) NSArray *ignoreKeys;
/**
 *  替换的参数
 */
@property (nonatomic, strong) NSDictionary *replaceKeys;
/**
 * 上传服务器时候的文件名
 */
@property (copy, nonatomic) NSString *fileName;

/**
 * 上传log文件到服务器时的log文件路径
 */
@property (copy, nonatomic) NSString *path;

/**
 *  头像
 */
@property (strong, nonatomic) UIImage *icon;

/**
 * 构造 Parameters ,GET 返回的是参数字典，POST返回的是POST的body体字典／数组，上传头像/GPS File 时返回nil
 */
- (id)getParameters;
@end
