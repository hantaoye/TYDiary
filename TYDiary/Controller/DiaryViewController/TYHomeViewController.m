//
//  TYHomeViewController.m
//  TYDiary
//
//  Created by taoYe on 15/5/21.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYHomeViewController.h"
#import "TYHomeMonthBar.h"
#import "TYHomeScrollView.h"
#import "TYHomeDiaryTableView.h"


@interface TYHomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *titleButton;
@property (weak, nonatomic) IBOutlet TYHomeMonthBar *topBar;
@property (weak, nonatomic) IBOutlet TYHomeScrollView *bottomScrollView;

@end

@implementation TYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)dealloc {
    [TYDebugLog debugFormat:@"%@ dealloc",NSStringFromClass([self class])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - action

- (IBAction)pressedTitleButton:(UIButton *)sender {
}


@end
