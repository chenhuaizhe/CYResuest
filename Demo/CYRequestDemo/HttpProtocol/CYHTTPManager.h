//
//  CYHTTPManager.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYBasicRequest.h"
#import "CYBasicResponce.h"
#import "CYHttpProtocolDef.h"
#import <AFNetworking.h>
#import "CYHttpResponseSerializerWithData.h"
#import <MJExtension.h>


/**
 *  数据操作枚举
 *
 *  常用组合：
 *  (CYHttpDataOperate_LoadFromLocal | CYHttpDataOperate_LoadFromRemote | CYHttpDataOperate_UpdataToLocal) 从本地获取，没有则请求网络，再缓存本地
 */
typedef NS_ENUM(NSInteger, CYHttpDataOperate) {
    /**
     *  从本地缓存数据库加载
     */
    CYHttpDataOperate_LoadFromLocal         =   0x0001,
    /**
     *  从远处服务器加载
     */
    CYHttpDataOperate_LoadFromRemote        =   0x0010,
    /**
     *  更新到本地数据库
     */
    CYHttpDataOperate_UpdataToLocal         =   0x0100,
};

/**
 *  Http数据请求管理者（负责分发数据请求，处理响应）
 */
@interface CYHTTPManager : NSObject

/**
 *  通过请求获取数据（默认从网络获取数据）
 *
 *  @param request    请求参数对象
 *  @param completion 响应
 */
+ (void)fetchDataWithRequest:(CYBasicRequest *)request
                  completion:( void (^)(id responseObject, NSError *error))completion;
/**
 *  通过请求获取数据
 *
 *  @param request    请求参数对象
 *  @param operate    操作
 *  @param completion 响应
 */
+ (void)fetchDataWithRequest:(CYBasicRequest *)request
                     operate:(CYHttpDataOperate)operate
                  completion:( void (^)(id responseObject, NSError *error))completion;
/**
 * 这个方法会返回各个模块的url地址信息，主要为了显示在客户端用来调试使用
 *
 */
+ (NSString *)urlInfoDecription;
@end
