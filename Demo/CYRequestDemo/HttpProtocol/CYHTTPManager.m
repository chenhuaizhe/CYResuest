//
//  CYHTTPManager.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "CYHTTPManager.h"
#import "CommonDefHeader.h"

static NSString * const STR_REQUEST = @"Request";
static NSString * const STR_RESPONCE = @"Responce";

@implementation CYHTTPManager

#pragma mark - 网络超时
+ (NSTimeInterval)timeoutInterval{
    return 15;
}

#pragma mark - 返回URL
+ (NSString *)baseUrl{
#ifdef DEBUG
   NSString *localUrl = [[NSUserDefaults standardUserDefaults]objectForKey:LocalBaseUrl];
    return localUrl?localUrl:URL_DEVELOP;
#else
    return URL_PRODUCT;
#endif
}
+ (NSString *)baseUserUrl{
#ifdef DEBUG
    NSString *localUrl = [[NSUserDefaults standardUserDefaults]objectForKey:LocalUserUrl];
    return localUrl?localUrl:URL_DEVELOP_USER;
#else
    return URL_PRODUCT_USER;
#endif
}
+ (NSString *)baseSportUrl{
#ifdef DEBUG
    NSString *localUrl = [[NSUserDefaults standardUserDefaults]objectForKey:LocalSportUrl];
    return localUrl?localUrl:URL_DEVELOP_SPORT;
#else
    return URL_PRODUCT_SPORT;
#endif
}
+ (NSString *)baseDeviceUrl{
#ifdef DEBUG
    NSString *localUrl = [[NSUserDefaults standardUserDefaults]objectForKey:LocalDeviceUrl];
    return localUrl?localUrl:URL_DEVELOP_DEVICE;
#else
    return URL_PRODUCT_DEVICE;
#endif
}

+ (NSString *)baseFileUrl{
#ifdef DEBUG
    NSString *localUrl = [[NSUserDefaults standardUserDefaults]objectForKey:LocalFileUrl];
    return localUrl?localUrl:URL_DEVELOP_FILE;
#else
    return URL_PRODUCT_FILE;
#endif
}

+ (NSString *)baseWeatherUrl{
#ifdef DEBUG
    NSString *localUrl = [[NSUserDefaults standardUserDefaults]objectForKey:LocalWeatherUrl];
    return localUrl?localUrl:URL_DEVELOP_WEATHER;
#else
    return URL_PRODUCT_WEATHER;
#endif
}

+ (NSString *)urlInfoDecription {
    NSString *str = [NSString stringWithFormat:@"User Url:%@\nSport Url:%@\nDevice Url:%@\nFile Url:%@\nWeather Url:%@\n",[self baseUserUrl],[self baseSportUrl],[self baseDeviceUrl],[self baseFileUrl],[self baseWeatherUrl]];
    return str;
}


#pragma mark - 请求体设置
+ (AFJSONRequestSerializer *)requestSerializer{
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    serializer.stringEncoding = NSUTF8StringEncoding;
    serializer.timeoutInterval = [self timeoutInterval];
    return serializer;
}
+ (AFHTTPResponseSerializer *)responseSerializer{
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    serializer.stringEncoding = NSUTF8StringEncoding;
    serializer.acceptableContentTypes = [serializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    serializer.acceptableContentTypes = [serializer.acceptableContentTypes setByAddingObject:@"text/html"];
    return serializer;
}
#pragma mark - mySecurityPolicy
+ (AFSecurityPolicy *)mySecurityPolicy {
    AFSecurityPolicy *securityPolicy = [[AFSecurityPolicy alloc] init];
    [securityPolicy setAllowInvalidCertificates:YES];
    return securityPolicy;
}
#pragma mark - url
+ (NSString *)urlWithRequest:(CYBasicRequest *)request {
    //url
    NSString *uri = [NSString stringWithFormat:@"%@%@",[request moduleName],[request functionName]];
    NSString *url = nil;
    if ([[request moduleName] isEqualToString:MODULENAME_FILE]) {
        url = [NSString stringWithFormat:@"%@%@", [self baseFileUrl], uri];
    }else if ([[request moduleName] isEqualToString:MODULENAME_DEVICE]) {
        url = [NSString stringWithFormat:@"%@%@", [self baseDeviceUrl], uri];
    }
    else if ([[request moduleName] isEqualToString:MODULENAME_SPORT]) {
        url = [NSString stringWithFormat:@"%@%@", [self baseSportUrl], uri];
    }
    else if ([[request moduleName] isEqualToString:MODULENAME_USER]) {
        url = [NSString stringWithFormat:@"%@%@", [self baseUserUrl], uri];
    }
    else if ([[request moduleName] isEqualToString:MODULENAME_WEATHER]) {
        url = [NSString stringWithFormat:@"%@%@", [self baseWeatherUrl], uri];
    }
    else
    {
        url = [NSString stringWithFormat:@"%@%@", [self baseUrl], uri];
    }
    if ([[request httpMethod] isEqualToString:POST]) {
        url = [NSString stringWithFormat:@"%@%@", url,request.postURLParameters];
    }
    //把url，request保存到本地，用于客户端展示
    [[NSUserDefaults standardUserDefaults]setObject:url forKey:@"url"];
    [[NSUserDefaults standardUserDefaults]setObject:[request description] forKey:@"request"];
    return url;
}

#pragma mark - 默认从网络请求
+ (void)fetchDataWithRequest:(CYBasicRequest *)request
                  completion:( void (^)(id responseObject, NSError *error))completion{
    
    [self fetchDataWithRequest:request
                       operate:CYHttpDataOperate_LoadFromRemote
                    completion:completion];
}


#pragma mark -  选择方式请求
+ (void)fetchDataWithRequest:(CYBasicRequest *)request
                     operate:(CYHttpDataOperate)operate
                  completion:( void (^)(id responseObject, NSError *error))completion{
    
    static NSMutableDictionary* requestContainer = nil;
    if (requestContainer == nil) {
        requestContainer = [[NSMutableDictionary alloc] initWithCapacity:10];
    }
    
    NSString* requestClassString = NSStringFromClass(request.class);
    NSString* responseClassString = [requestClassString stringByReplacingOccurrencesOfString:STR_REQUEST
                                                                                  withString:STR_RESPONCE];
    Class responseClass = NSClassFromString(responseClassString);
    
    if ((operate & CYHttpDataOperate_LoadFromLocal) == CYHttpDataOperate_LoadFromLocal) {
        // load from local
    }
    if ([requestContainer objectForKey:[request functionName]]) {
        NSLog(@"正在加载网络数据，请稍后");
        return;
    }
    
    if ((operate & CYHttpDataOperate_LoadFromRemote) == CYHttpDataOperate_LoadFromRemote) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [self requestSerializer];
        manager.responseSerializer = [self responseSerializer];
//        manager.securityPolicy = [self mySecurityPolicy];
        void (^completionHandle)(id responseData, NSError * err) = ^(id responseData, NSError* err) {
            if (err == nil && (operate & CYHttpDataOperate_UpdataToLocal) == CYHttpDataOperate_UpdataToLocal) {
                // save to local
//                [[CYDataService shareInstance] updateHttpCacheData:responseData withKey:uri];
                
            }
            
            NSDictionary *dict = [self dictFromResponseObject:responseData];
            
            NSString *res = [NSString stringWithFormat:@"responseData JSONSerialization to jsonDict = %@\nerror = %@",dict,err];
            //把response保存到本地，用于客户端展示
            [[NSUserDefaults standardUserDefaults]setObject:res forKey:@"responce"];
            [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFICATION_RESPONCE_GET object:nil];
            CYBasicResponce *response = [responseClass mj_objectWithKeyValues:dict];
//
            completion( response, err );
            
            [requestContainer removeObjectForKey:[request functionName]];
        };
        
        [requestContainer setObject:request forKey:[request functionName]];
        
       NSString *url = [CYHTTPManager urlWithRequest:request];
        
        if ([[request httpMethod] isEqualToString:POST] && ![[request moduleName] isEqualToString:MODULENAME_FILE]) {
            [manager POST:url
               parameters:[request getParameters]
                 progress:nil
                  success:^(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject) {
                      completionHandle( responseObject, nil );
                  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                      completionHandle( [[error userInfo] valueForKey:HTTP_RESPONSE_DATA], error);
                  }];
        }
        else if ([[request httpMethod] isEqualToString:POST] && [[request moduleName] isEqualToString:MODULENAME_FILE]) {
                        NSString *fileName = [request fileName];
            NSData *data;
            NSString *mimeType;
            if ([[request functionName]isEqualToString:FUNCNAME_UPLOAD_ICON]) {
                UIImage *img = [request icon];
                mimeType = @"image/jpg";
                data = UIImageJPEGRepresentation(img, 0.2);
            } else {
                NSString *path = [request path];
                mimeType = [[NSString alloc] getMIMETypeWithCAPIAtFilePath:path];
                data = [NSData dataWithContentsOfFile:path];
            }
            [manager POST:url parameters:[request getParameters] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:mimeType];
            } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                completionHandle( responseObject, nil );
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                completionHandle( [[error userInfo] valueForKey:HTTP_RESPONSE_DATA], error);
            }];
        }
        else {
            [manager GET:url
              parameters:[request getParameters]
                progress:nil
                 success:^(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject) {
                     completionHandle( responseObject, nil );
                 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                     completionHandle( [[error userInfo] valueForKey:HTTP_RESPONSE_DATA], error);
                 }];
        }
    }
}

#pragma mark - 格式化字典
+ (NSDictionary *)dictFromResponseObject:(id)responseObject{
    NSData* responseData = nil;
    NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
    if ([responseObject isKindOfClass:[NSData class]]) {
        responseData = responseObject;
    }else if ([responseObject isKindOfClass:[NSString class]]) {
        responseData = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
    }else if([responseObject isKindOfClass:[NSDictionary class]]) {
        return responseObject;
    } else{
        return @{@"code":@(-10000),
                 @"msg":@"wrong data format or request time out"};
    }
    NSError* error;
    NSDictionary* dict = [NSJSONSerialization
                              JSONObjectWithData:responseData 
                              options:NSJSONReadingAllowFragments error:&error];
    if (!error) {

        return dict;
    }
    else {
        return @{@"error":error,@"message":@"json parse failed",@"str":str};
    }
    
}

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
