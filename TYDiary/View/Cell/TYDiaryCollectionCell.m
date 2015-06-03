//
//  TYDiaryTableViewCell.m
//  TYDiary
//
//  Created by taoYe on 15/5/30.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYDiaryCollectionCell.h"

@interface TYDiaryCollectionCell ()
@property (weak, nonatomic) IBOutlet UIImageView *customImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation TYDiaryCollectionCell

+ (instancetype)renderCellWithCollectionCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath diary:(TYDiary *)diary cell:(TYDiaryCollectionCell *)cell {
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
