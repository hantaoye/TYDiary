//
//  TYShowDiaryViewController.m
//  TYDiary
//
//  Created by taoYe on 15/5/30.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYShowDiaryViewController.h"
#import "TYShowDiaryDataSource.h"
#import <MJRefresh/MJRefresh.h>

@interface TYShowDiaryViewController () <UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet TYShowDiaryDataSource *dataSource;

@property (assign, nonatomic) NSInteger month;

@end

@implementation TYShowDiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.minimumLineSpacing = 10; //上下边距;
//    CGFloat width = (self.view.frame.size.width - 2 * 3) / 3;
//    layout.itemSize = CGSizeMake(width, width);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    __weak typeof(self) weakSelf = self;
    [self.collectionView addLegendHeaderWithRefreshingBlock:^{
        [weakSelf refreshWithYear:0 month:weakSelf.month];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma UICollectionDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row % 5;
    CGFloat width = 0;
    if (row == 0 || row == 1) {
        width = (self.view.bounds.size.width - 30) / 2;
    } else {
        width = (self.view.bounds.size.width - 41) / 3;
    }
    return CGSizeMake(width, width + 57);//57 为下面的label的高
}

- (void)refreshWithYear:(NSInteger)year month:(NSInteger)month {
    self.dataSource.year = year > 0 ? year : 0;
    if (month > 12 || month <= 0) {
        [RSProgressHUD showErrorWithStatus:@"月份错误"];
        return;
    }
    [self.dataSource refreshWithMonth:month action:^(NSError *error) {
        _month = month;
        if (error) {
            run(^{
                [self.collectionView reloadData];
                [TYDebugLog error:error.localizedDescription];
            });
        } else {
            run(^{
                [self.collectionView reloadData];
            });
        }
        
    }];
}

@end
