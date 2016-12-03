//
//  SettingViewController.m
//  CYRequestDemo
//
//  Created by CY on 2016/12/2.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "SettingViewController.h"
#import "CommonDefHeader.h"

typedef NS_ENUM(NSInteger,SettingType) {
    SettingTypeBaseUrl,
    SettingTypeUserUrl,
    SettingTypeSportUrl,
    SettingTypeDeviceUrl,
    SettingTypeFileUrl,
    SettingTypeWeatherUrl,
};

@interface SettingViewController ()
@property (strong, nonatomic) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}


- (NSArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = @[@"Set Base Url",@"Set User Url",@"Set Sport Url",@"Set Device Url",@"Set File Url",@"Set Weather Url"];
    }
    return _dataArray;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell"];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Please Set" message:@"make sure the format is right" preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *tf = alertVC.textFields.firstObject;
        SettingType settingType;
        switch (settingType) {
            case SettingTypeBaseUrl:
                [[NSUserDefaults standardUserDefaults]setObject:tf.text forKey:LocalBaseUrl];
                break;
            case SettingTypeUserUrl:
                [[NSUserDefaults standardUserDefaults]setObject:tf.text forKey:LocalUserUrl];
                break;
            case SettingTypeSportUrl:
                [[NSUserDefaults standardUserDefaults]setObject:tf.text forKey:LocalSportUrl];
                break;
            case SettingTypeDeviceUrl:
                [[NSUserDefaults standardUserDefaults]setObject:tf.text forKey:LocalDeviceUrl];
                break;
            case SettingTypeFileUrl:
                [[NSUserDefaults standardUserDefaults]setObject:tf.text forKey:LocalFileUrl];
                break;
            case SettingTypeWeatherUrl:
                [[NSUserDefaults standardUserDefaults]setObject:tf.text forKey:LocalWeatherUrl];
                break;
            default:
                break;
        }
    }];
    [alertVC addAction:okAction];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertVC addAction:cancelAction];
    [self.navigationController presentViewController:alertVC animated:YES completion:nil];

    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
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
