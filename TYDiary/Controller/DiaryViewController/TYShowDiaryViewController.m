//
//  TYShowDiaryViewController.m
//  TYDiary
//
//  Created by taoYe on 15/5/30.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYShowDiaryViewController.h"

@interface TYShowDiaryViewController () <UICollectionViewDelegateFlowLayout>

@end

@implementation TYShowDiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.minimumLineSpacing = 10;
//    CGFloat width = (self.view.frame.size.width - 2 * 3) / 3;
//    layout.itemSize = CGSizeMake(width, width);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
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
        width = TYScreenWidth / 2 - 30;
    } else {
        width = TYScreenWidth / 3 - 40;
    }
    return CGSizeMake(width, width + 57);//57 为下面的label的高
}


@end
