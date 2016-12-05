//
//  MainViewController.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/29.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "MainViewController.h"
#import "NetWorkhandle.h"
#import "CommonDefHeader.h"
#import "DetailViewController.h"

typedef NS_ENUM(NSInteger,ModuleName) {
    ModuleNameUser,
    ModuleNameSport,
    ModuleNameDevice,
    ModuleNameFile,
    ModeulNameWeather
};

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) NSArray *sectionTitles;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = @[
                       @[@"Login",@"Register",@"Get User Info",@"Update User Info",@"Getback Password By Email",@"Get Back Password",@"Change Password",@"Check Email Exist"],
                       @[@"Sports Download",@"Sports Upload",@"Walking Download",@"Walking Upload",@"GPS Download",@"GPS Upload",@"Heartrate Download",@"Heartrate Upload",@"HeartrateHours Download",@"HeartrateHours Upload",@"Weight Download",@"Weight Upload",@"Sleep Download",@"Sleep Upload"],
                       @[@"Firmwarm Update"],
                       @[@"Icon Upload",@"Log Upload",@"GPS File Upload"],
                       @[@"Get Weather"],
                       ];
    }
    return _dataArray;
}

- (NSArray *)sectionTitles {
    if (_sectionTitles == nil) {
        _sectionTitles = @[@"User",@"Sport",@"Device",@"File",@"Weather"];
    }
    return _sectionTitles;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table view 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionTitles[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.dataArray[section];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"basicCell"];
    cell.textLabel.text = [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self clearTempData];
    ModuleName moduleName = indexPath.section;
    switch (moduleName) {
        case ModuleNameUser:
            [self selectUserModuleAtIndex:indexPath.row];
            break;
        case ModuleNameSport:
            [self selectSportModuleAtIndex:indexPath.row];
            break;
        case ModuleNameDevice:
            [self selectDeviceModuleAtIndex:indexPath.row];
            break;
        case ModuleNameFile:
            [self selectFileModuleAtIndex:indexPath.row];
            break;
            case ModeulNameWeather:
            [self selectWeatherModuleAtIndex:indexPath.row];
            break;
        default:
            break;
    }
}

/**
 * 清除保存在本地的数据
 */
- (void)clearTempData {
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"url"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"request"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"responce"];

}

- (void)showUserIcon:(NSNotification *)userInfo {
    NSDictionary *info = userInfo.userInfo;
    [self.view bringSubviewToFront:self.imageView];
    self.imageView.image = [info objectForKey:@"img"];
}

#pragma mark - action
- (void)selectUserModuleAtIndex:(NSInteger )row {
    switch (row) {
        case 0:
            [[NetWorkhandle shareInstance]sendLoginRequest];
            break;
        case 1:
            [[NetWorkhandle shareInstance]sendRegisterRequest];
            break;
        case 2:
            [[NetWorkhandle shareInstance]sendGetUserInfoRequest];
            break;
        case 3:
            [[NetWorkhandle shareInstance]sendUpdateUserinfoRequest];
            break;
        case 4:
            [[NetWorkhandle shareInstance]sendGetPasswordByEmailRequest];
            break;
        case 5:
            [[NetWorkhandle shareInstance]sendGetPasswordRequest];
            break;
        case 6:
            [[NetWorkhandle shareInstance]sendChangePasswordRequest];
            break;
        case 7:
            [[NetWorkhandle shareInstance]sendCheckEmailExistRequest];
            break;

        default:
            break;
    }

}

- (void)selectSportModuleAtIndex:(NSInteger )row {
    switch (row) {
        case 0:
            [[NetWorkhandle shareInstance]sendSportsDownloadRequest];
            break;
        case 1:
            [[NetWorkhandle shareInstance]sendSportsUploadRequest];
            break;
        case 2:
            [[NetWorkhandle shareInstance]sendWalkingDownloadRequest];
            break;
        case 3:
            [[NetWorkhandle shareInstance]sendWalkingUploadRequest];
            break;
        case 4:
            [[NetWorkhandle shareInstance]sendGPSDownloadRequest];
            break;
        case 5:
            [[NetWorkhandle shareInstance]sendGPSUploadRequest];
            break;
        case 6:
            [[NetWorkhandle shareInstance]sendHeartrateDownloadRequest];
            break;
        case 7:
            [[NetWorkhandle shareInstance]sendHeartrateUploadRequest];
            break;
        case 8:
            [[NetWorkhandle shareInstance]sendHeartHoursDownloadRequest];
            break;
        case 9:
            [[NetWorkhandle shareInstance]sendHeartrateHoursUploadRequest];
            break;
        case 10:
            [[NetWorkhandle shareInstance]sendWeightDownloadRequest];
            break;
        case 11:
            [[NetWorkhandle shareInstance]sendWeightUploadRequest];
            break;
        case 12:
            [[NetWorkhandle shareInstance]sendSleepDownloadRequest];
            break;
        case 13:
            [[NetWorkhandle shareInstance]sendSleepUploadRequest];
            break;
        default:
            break;
    }
}

- (void)selectDeviceModuleAtIndex:(NSInteger )row {
    switch (row) {
        case 0:
            [[NetWorkhandle shareInstance]sendFWUpdateRequest];
            break;
        default:
            break;
    }

}

- (void)selectFileModuleAtIndex:(NSInteger )row {
    switch (row) {
        case 0:
            [[NetWorkhandle shareInstance]sendIconUploadRequest];
            break;
        case 1:
            [[NetWorkhandle shareInstance]sendLogFileUploadRequest];
            break;
        case 2:
            [[NetWorkhandle shareInstance]sendGPSFileUploadRequest];
            break;
            
        default:
            break;
    }
}
- (void)selectWeatherModuleAtIndex:(NSInteger )row {
    switch (row) {
        case 0:
            [[NetWorkhandle shareInstance]sendWeatherRequest];
            break;
        default:
            break;
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
