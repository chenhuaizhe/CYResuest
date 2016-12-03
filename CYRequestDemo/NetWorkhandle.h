//
//  NetWorkhandle.h
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkhandle : NSObject

+ (instancetype)shareInstance ;

- (void)sendSportsDownloadRequest ;
- (void)sendSportsUploadRequest;

- (void)sendWeatherRequest;

- (void)sendFWUpdateRequest;

- (void)sendSleepUploadRequest ;
- (void)sendSleepDownloadRequest;

- (void)sendWeightUploadRequest ;
- (void)sendWeightDownloadRequest;

- (void)sendHeartrateHoursUploadRequest ;
- (void)sendHeartHoursDownloadRequest ;
- (void)sendHeartrateUploadRequest;
- (void)sendHeartrateDownloadRequest ;

- (void)sendIconUploadRequest ;
- (void)sendGPSFileUploadRequest;
- (void)sendLogFileUploadRequest ;


- (void)sendCheckEmailExistRequest;
- (void)sendChangePasswordRequest ;
- (void)sendGetPasswordRequest ;
- (void)sendGetPasswordByEmailRequest ;
- (void)sendUpdateUserinfoRequest ;
- (void)sendGetUserInfoRequest ;
- (void)sendRegisterRequest ;
- (void)sendLoginRequest ;

- (void)sendWalkingUploadRequest ;
- (void)sendWalkingDownloadRequest ;
- (void)sendGPSUploadRequest ;
- (void)sendGPSDownloadRequest ;
@end
