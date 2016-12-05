//
//  CYHttpProtocolDef.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/28.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#ifndef CYHttpProtocolDef_h
#define CYHttpProtocolDef_h

/**
 * 正式服
 */
#define URL_PRODUCT @""

/**
 * 测试服
 */
#define URL_DEVELOP @"http://127.0.0.1:8080"

/**
 * 正式服（用户）
 */
#define URL_PRODUCT_USER @""

/**
 * 测试服（用户）
 */
#define URL_DEVELOP_USER @"http://127.0.0.1:8080"

/**
 * 正式服（运动）
 */
#define URL_PRODUCT_SPORT @""

/**
 * 测试服（运动）
 */
#define URL_DEVELOP_SPORT @"http://127.0.0.1:8080"

/**
 * 正式服（设备）
 */
#define URL_PRODUCT_DEVICE @""

/**
 * 测试服（设备）
 */
#define URL_DEVELOP_DEVICE @"http://127.0.0.1:8080"

/**
 * 正式服（头像、文件）
 */
#define URL_PRODUCT_FILE @""

/**
 * 测试服 （头像、文件）
 */
#define URL_DEVELOP_FILE @"http://127.0.0.1:8080"

/**
 * 正式服（天气）
 */
#define URL_PRODUCT_WEATHER @""

/**
 * 测试服（天气）
 */
#define URL_DEVELOP_WEATHER @"http://127.0.0.1:8080"



/**
 *  模块 - 用户
 */
#define MODULENAME_USER @"/user"


/**
 * 模块 - 数据上传下载
 */
#define MODULENAME_SPORT @"/sport"


/**
 * 模块 - 设备
 */
#define MODULENAME_DEVICE @"/device"


/**
 * 模块 - 文件
 */
#define  MODULENAME_FILE @"/fileservice"

/**
 * 模块 - 天气
 */
#define  MODULENAME_WEATHER @"/weather"


#define FUNCNAME_LOGIN                      @"/login"                // login
#define FUNCNAME_REGISTER                   @"/register"             // register
#define FUNCNAME_GET_USERINFO               @"/info"                 // get user info
#define FUNCNAME_UPDATE_USERINFO            @"/update"               // update user info
#define FUNCNAME_GET_PWD_BY_EMAIL           @"/temporarypwd"             // get password by email
#define FUNCNAME_GET_PWD                    @"/getbackpwd"           // get password
#define FUNCNAME_CHANGE_PWD                 @"/changepwd"            // change password
#define FUNCNAME_CHECK_EMAIL                @"/exist/email"          //check the email exist or not

#define FUNCNAME_DOWNLOAD_SPORTS            @"/sports/download"      // download sports data
#define FUNCNAME_UPLOAD_SPORTS              @"/sports/upload"        // upload sports data
#define FUNCNAME_DOWNLOAD_WALKING           @"/walking/download"     // download walking data
#define FUNCNAME_UPLOAD_WALKING             @"/walking/upload"       // upload walking data
#define FUNCNAME_DOWNLOAD_GPS               @"/gpssport/download"     // download gps sports data
#define FUNCNAME_UPLOAD_GPS                 @"/gpssport/upload"      // upload gps sports data

#define FUNCNAME_UPLOAD_SLEEP               @"/sleep/upload"
#define FUNCNAME_DOWNLOAD_SLEEP             @"/sleep/download"

#define FUNCNAME_UPLOAD_WEIGHT              @"/weight/upload"
#define FUNCNAME_DOWNLOAD_WEIGHT            @"/weight/download"

#define FUNCNAME_UPLOAD_HEARTRATE           @"/heartrate/upload"
#define FUNCNAME_DOWNLOAD_HEARTRATE         @"/heartrate/download"
#define FUNCNAME_UPLOAD_HRHOURS             @"/heartrateHours/upload"
#define FUNCNAME_DOWNLOAD_HRHOURS           @"/heartrateHours/download"

#define FUNCNAME_UPLOAD_ICON                @"/upload_icon"  //
#define FUNCNAME_UPLOAD_FILE_GPS            @"/upload_gps_data"
#define FUNCNAME_UPLOAD_LOG                 @"/upload_applog"  //
#define FUNCNAME_FWUPDATE                   @"/fwupdate"  //
#define FUNCNAME_WEATHER                    @"/getweather"


#endif /* CYHttpProtocolDef_h */
