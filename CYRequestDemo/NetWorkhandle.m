//
//  NetWorkhandle.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/30.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "NetWorkhandle.h"
#import "CYHTTPManager.h"
#import "CYRequestHeader.h"
#import "CYResponceHeader.h"
#import "CommonDefHeader.h"

#define N_NSLOG         NSLog(@"\nFunc:%s  Line:%d   Info:\nresponseObject = %@,error = %@\n\n---", __FUNCTION__, __LINE__,responseObject,error);


@implementation NetWorkhandle

+ (instancetype)shareInstance {
    static NetWorkhandle *net = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        net = [[self alloc]init];
    });
    return net;
}

#pragma mark -
#pragma mark - Weather


- (void)sendSportsDownloadRequest {
    
    CYSportsDownloadRequest *req = [CYSportsDownloadRequest requestWithDayStart:@"20161127" days:20];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
        CYSportsDownloadResponce *res = (CYSportsDownloadResponce *)responseObject;
        NSArray *sportsArray = res.content;
        NSLog(@"sportsArray=%@",sportsArray);
        
    }];
    
    
}
- (void)sendSportsUploadRequest {
    NSArray *sports = @[
                        @{
                            @"sport_name": @"登山",
                            @"uid": @144644799476738229,
                            @"count": @0,
                            @"start_time": @1480301050,
                            @"type": @5,
                            @"calorie": @195.000005,
                            @"sportCode": @"000505",
                            @"data_from": @"录入",
                            @"end_time": @1480301050,
                            @"activity": @30,
                            @"distance": @0,
                            @"steps": @0
                            },
                        @{
                            @"sport_name": @"快走",
                            @"uid": @144644799476738229,
                            @"count": @0,
                            @"start_time": @1480301311,
                            @"type": @181,
                            @"calorie": @125,
                            @"sportCode": @"018102",
                            @"data_from": @"录入",
                            @"end_time": @1480301311,
                            @"activity": @30,
                            @"distance": @0,
                            @"steps": @0
                            }
                        ];
    CYSportsUploadRequest *req = [CYSportsUploadRequest requestWithPostArray:sports];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
        CYSportsUploadResponce *res = (CYSportsUploadResponce *)responseObject;
    }];
}

- (void)sendWalkingUploadRequest {
    NSArray *arr = @[
                    @{
                        @"uid": @144644799476738229,
                        @"record_date": @1480301311,
                        @"data_from": @"iPhone SE",
                        @"steps": @111,
                        @"calorie": @222.2,
                        @"walk_distance": @2.2,
                        @"run_distance": @3.3
                        },
                        @{
                        @"uid": @144644799476738229,
                        @"record_date": @1480301312,
                        @"data_from": @"iPhone SE",
                        @"steps": @111,
                        @"calorie": @222.2,
                        @"walk_distance": @2.2,
                        @"run_distance": @3.3
                        }
                    ];
    CYWalkingUploadRequest *req = [CYWalkingUploadRequest requestWithPostArray:arr];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG

    }];
}
- (void)sendWalkingDownloadRequest {
    CYWalkingDownloadRequest *req = [CYWalkingDownloadRequest requestWithDayStart:@"20161130" days:20];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendGPSUploadRequest {
    NSArray *arr = @[
                    @{
                        @"uid": @144644799476738229,
                        @"timeStart": @2565,
                        @"timeEnd": @8565,
                        @"sports_type": @0,
                        @"duration": @10,
                        @"distance": @10,
                        @"calorie": @10,
                        @"avgPage": @10,
                        @"cadence": @10,
                        @"track_url": @"22222"
                    }
                    ];
    CYGpsUploadRequest *req = [CYGpsUploadRequest requestWithPostArray:arr];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendGPSDownloadRequest {
    CYGpsDownloadRequest *req = [CYGpsDownloadRequest requestWithDayStart:@"20161130" days:10];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG

    }];
}

- (void)sendSleepUploadRequest {
    NSArray *arr = @[
                     @{
                         @"uid": @144644799476738229,
                         @"start_time": @1480525500,
                         @"end_time": @1480547760,
                         @"deep_time": @140,
                         @"light_time": @231,
                         @"feel_type": @0,
                         @"data_from": @"Bracel13-0754",
                         @"action": @"space",
                         @"sleep_segment": @[
                                           @{
                                               @"st": @0,
                                               @"et": @30,
                                               @"type": @1
                                           },
                                           @{
                                               @"st": @30,
                                               @"et": @71,
                                               @"type": @2
                                           },
                                           @{
                                               @"st": @71,
                                               @"et": @85,
                                               @"type": @1
                                           },
                                           @{
                                               @"st": @85,
                                               @"et": @128,
                                               @"type": @2
                                           },
                                           @{
                                               @"st": @128,
                                               @"et": @173,
                                               @"type": @1
                                           },
                                           @{
                                               @"st": @173,
                                               @"et": @185,
                                               @"type": @2
                                           },
                                           @{
                                               @"st": @185,
                                               @"et": @200,
                                               @"type": @1
                                           },
                                           @{
                                               @"st": @200,
                                               @"et": @218,
                                               @"type": @2
                                           },
                                           @{
                                               @"st": @218,
                                               @"et": @314,
                                               @"type": @1
                                           },
                                           @{
                                               @"st": @314,
                                               @"et": @331,
                                               @"type": @2
                                           },
                                           @{
                                               @"st": @331,
                                               @"et": @356,
                                               @"type": @1
                                           },
                                           @{
                                               @"st": @356,
                                               @"et": @365,
                                               @"type": @2
                                           },
                                           @{
                                               @"st": @365,
                                               @"et": @371,
                                               @"type": @1
                                           },
                                           @{
                                               @"st": @371,
                                               @"et": @371,
                                               @"type": @4
                                           }
                                           ]
                     }
                     ];
    CYSleepUploadRequest *req = [CYSleepUploadRequest requestWithPostArray:arr];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
       N_NSLOG
    }];
}
- (void)sendSleepDownloadRequest {
    CYSleepDownloadRequest *req = [CYSleepDownloadRequest requestWithDayStart:@"20161201" days:20];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
       N_NSLOG
    }];
}
- (void)sendWeightUploadRequest {
    NSArray *arr = @[
                     @{
                         @"uid": @144644799476738229,
                         @"record_date": @1480525500,
                         @"weight": @66,
                         @"data_from": @"manual",
                         @"water": @0,
                         @"bodyfat ": @0,
                         @"body_age": @0,
                         @"bmi": @22.22,
                         @"bone_weight": @0,
                         @"muscule": @0,
                         @"calorie": @0
                     }
                     ];
    CYWeightUploadRequest *req = [CYWeightUploadRequest requestWithPostArray:arr];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendWeightDownloadRequest {
    CYWeightDownloadRequest *req = [CYWeightDownloadRequest requestWithDayStart:@"20161201" days:20];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendHeartrateHoursUploadRequest {
    NSArray *arr = @[
                     @{
                         @"uid": @144644799476738229,
                         @"record_date": @1480547760,
                         @"data_from": @"Bracel05-8203",
                         @"detail":@[@77,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                   @103,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                   @103,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                   @103,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                   @103,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                   @103,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                   @103,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                   @103,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                   @103,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                   @103,@103,@66,@89,@55,@77,@99,@88,@99,@66,
                                ]
                     }];
    CYHrHourUploadRequest *req = [CYHrHourUploadRequest requestWithPostArray:arr];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendHeartHoursDownloadRequest {
    CYHrHourDownloadRequest *req = [CYHrHourDownloadRequest requestWithDayStart:@"20161201" days:20];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendHeartrateUploadRequest {
    NSArray *arr = @[
                     @{
                         @"uid": @144644799476738229,
                         @"start_time": @1480525500,
                         @"end_time": @1480547760,
                         @"data_from": @"Bracel05-8203",
                         @"detail": @{
                             @"hr_type": @240,
                             @"start_time": @548,
                             @"end_time": @570,
                             @"energy": @15.500000,
                             @"r1Time": @10,
                             @"r2Time": @0,
                             @"r3Time": @0,
                             @"r4Time": @0,
                             @"r5Time": @0,
                             @"r1Energy": @0.000000,
                             @"r2Energy": @0.000000,
                             @"r3Energy": @0.000000,
                             @"r4Energy": @0.000000,
                             @"r5Energy": @0.000000,
                             @"r1Hr": @66,
                             @"r2Hr": @0,
                             @"r3Hr": @0,
                             @"r4Hr": @0,
                             @"r5Hr": @0
                         }
                     }
                     ];
    CYHeartrateUploadRequest *req = [CYHeartrateUploadRequest requestWithPostArray:arr];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendHeartrateDownloadRequest {
    CYHeartrateDownloadRequest *req = [CYHeartrateDownloadRequest requestWithDayStart:@"20161201" days:20];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
#pragma mark -
#pragma mark - User

- (void)sendCheckEmailExistRequest {
    CYCheckEmailExistRequest *req = [CYCheckEmailExistRequest requestWithEmail:@"ccyy@qq.com"];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendChangePasswordRequest {
    NSDictionary *dic = @{
        @"uid": @"148049495113589032",
        @"old_password": @"123456",
        @"new_password": @"654321"
        };
    CYChangePwdRequest *req = [CYChangePwdRequest requestWithPostDictionary:dic];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
       N_NSLOG
    }];
}
- (void)sendGetPasswordRequest {
    NSDictionary *dic = @{
                          @"phone": @12345678910,
                          @"password": @"123456",
                          @"email": @"ccyy@qq.com"
                          };
    CYGetPwdRequest *req = [CYGetPwdRequest requestWithPostDictionary:dic];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendGetPasswordByEmailRequest {
    CYGetPwdByEmailRequest *req = [CYGetPwdByEmailRequest requestWithEmail:@"ccyy@qq.com"];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendUpdateUserinfoRequest {
    NSDictionary *dic = @{
        @"uid": @148049495113589032,
        @"nickname": @"cccyyy",
        @"gender": @0,
        @"birthday": @"19990909",
        @"portrait_url": @"xxx",
        @"height": @101,
        @"weight": @110,
        @"working_type": @0,
        @"physical": @0,
        @"bind_phone": @0,
        @"bind_email": @"",
        @"cardio": @0,
        @"daily_activity": @""
        };
    CYUpdateUserInfoRequest *req = [CYUpdateUserInfoRequest requestWithPostDictionary:dic];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG

    }];
}
- (void)sendGetUserInfoRequest {
    CYGetUserInfoRequest *req = [[CYGetUserInfoRequest alloc]init];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
}
- (void)sendRegisterRequest {
    int i = arc4random() % 90005;
    NSString *str = [NSString stringWithFormat:@"cc%dyy@qq.com",i];
    NSDictionary *dic = @{
        @"account": str,
        @"password": @"123456",
        @"phone": @12345678910,
        @"type": @2
        };
    CYRegisterRequest *req = [CYRegisterRequest requestWithPostDictionary:dic];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG

    }];
}
- (void)sendLoginRequest {
       NSDictionary *dic = @{
        @"account": @"ccyy@qq.com",
        @"type": @2,
        @"password": @"654321"
        };
    CYLoginRequest *req = [CYLoginRequest requestWithPostDictionary:dic];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        CYLoginResponce *res = (CYLoginResponce *)responseObject;
    }];
}
#pragma mark -
#pragma mark - File
- (void)sendIconUploadRequest {
    UIImage *icon = [UIImage imageNamed:@"ccyy.jpg"];
    CYBasicRequest *r = [[CYBasicRequest alloc]init];
    NSString * fileName = [NSString stringWithFormat:@"%lu.jpg",r.uid];
    CYIconUploadRequest *req = [CYIconUploadRequest requestWithFileName:fileName Icon:icon];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
        CYIconUploadResponce *res = (CYIconUploadResponce *)responseObject;
    }];
    
    
}

- (void)sendLogFileUploadRequest {
    CYBasicRequest *r = [[CYBasicRequest alloc]init];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"log.txt" ofType:nil];
    NSString *fileName = @"log.txt";
    NSDictionary *dic = @{@"uid":@(r.uid),@"type":@1};
    CYLogUploadRequest *req = [CYLogUploadRequest requestWithFileName:fileName Path:path PostDictionary:dic];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
        CYLogUploadResponce *res =  (CYLogUploadResponce *)responseObject;
    }];
}

- (void)sendGPSFileUploadRequest {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"147814529871993714_20161202.txt" ofType:nil];
    NSString *fileName = @"147814529871993714_20161202.txt";
    CYGPSFileUploadRequest *req = [CYGPSFileUploadRequest requestWithFileName:fileName Path:path];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];

}

#pragma mark -
#pragma mark - Device

- (void)sendFWUpdateRequest {
    NSDictionary *dic = @{@"platform":@"Dialog",
                          @"device_type":@1,//1->手环 ，2->体重秤 ,3->手表
                          @"device_model":@9,
                          @"fw_version":@"1.0.1.7",
                          @"app":@3,// 1.zeroner; 2 零一i5; 3 埃微健康助手; 4. zeroner health; 5. iwown fit; 8. all
                          @"app_version":@4030,
                          @"app_platform":@2,//1. android 2. iOS  8. all
                          @"module":@1};
    CYFWUpdateRequest *req = [CYFWUpdateRequest requestWithPostDictionary:dic];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
        N_NSLOG
    }];
    
}
#pragma mark -
#pragma mark - Weather
- (void)sendWeatherRequest {
    CYWeatherRequest *req = [CYWeatherRequest requestWithLatitude:39.91488908 longitude:116.40387397 city:@"Shenzhen"];
    [CYHTTPManager fetchDataWithRequest:req completion:^(id responseObject, NSError *error) {
       N_NSLOG
    }];
    
}


@end
