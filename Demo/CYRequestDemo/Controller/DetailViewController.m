//
//  DetailViewController.m
//  CYRequestDemo
//
//  Created by CY on 2016/11/29.
//  Copyright © 2016年 chenyuan. All rights reserved.
//

#import "DetailViewController.h"
#import "CommonDefHeader.h"

@interface DetailViewController () 
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightConstraint;

@end

@implementation DetailViewController

- (void)loadView {
    [super loadView];
    //通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(refreshTextView) name:NOTIFICATION_RESPONCE_GET object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTextViewHeight];
    
}

/**
 * 设置textView的高度
 */
- (void)setTextViewHeight {
    if (self.textView.contentSize.height < (SCREEN_HEIGHT - self.textView.frame.origin.y) ) {
        CGSize size = [self.textView sizeThatFits:self.textView.contentSize];
        self.textViewHeightConstraint.constant = size.height;;
    }
    else {
        self.textViewHeightConstraint.constant = SCREEN_HEIGHT - self.textView.frame.origin.y-40;
    }
}

#pragma mark - segment
- (IBAction)segmentedControlValueChanged:(UISegmentedControl *)sender {
    [self refreshTextView];
}

#pragma mark - action

/**
 * 刷新text view 的显示内容
 */
- (void)refreshTextView {
    if (self.segment.selectedSegmentIndex == 0) {
        NSString *url = [[NSUserDefaults standardUserDefaults]objectForKey:@"url"];
        self.textView.text = url;
    }
    else if (self.segment.selectedSegmentIndex == 1) {
        NSString *request = [[NSUserDefaults standardUserDefaults]objectForKey:@"request"];
        self.textView.text = request;
    }
    else {
        NSString *responce = [[NSUserDefaults standardUserDefaults]objectForKey:@"responce"];
        self.textView.text = responce;
    }
    [self setTextViewHeight];
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
