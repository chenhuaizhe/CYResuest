//
//  RetCodeViewController.m
//  CYRequestDemo
//
//  Created by CY on 2016/12/3.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "RetCodeViewController.h"

@interface RetCodeViewController ()
@property (strong, nonatomic) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RetCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = @[@"DBError = 10001",
                       
                       @"NoData = 10404",
                       
                       @"ParameterNotProvided = 10002",
                       
                       @"BaiduServiceNotRegister = 10003",
                       
                       @"BaiduServiceFailure = 10004",
                       
                       @"AccessUserServiceFailed = 10005",
                       
                       @"InvalidLoginAccountType = 50001",
                       
                       @"InvalidPhoneNumberformat = 50002",
                       
                       @"PasswordNotMatch = 50003",
                       
                       @"UserAlreadyExist = 50004",
                       
                       @"SendPasswordMailFailed = 50005",
                       
                       @"InvalidPlatform = 50006",
                       
                       @"RelativeAlreadyExist = 50007",
                       
                       @"UnionIDNotFound = 50008",
                       
                       @"InvalidQueryType = 50009",
                       
                       @"NoResultsOrResultsTooMany = 50010",
                       
                       @"InvalidRegisterType = 50011",
                       
                       @"UserNotExist = 50012",
                       
                       @"NoNewFirmwareAvailable = 60001",
                       
                       @"WeChatInfoNOTRegister = 60002",
                       
                       @"SaveFileError = 60003",];
    }
    return _dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"retCodeCell"];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
