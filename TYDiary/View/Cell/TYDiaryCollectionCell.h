//
//  TYDiaryTableViewCell.h
//  TYDiary
//
//  Created by taoYe on 15/5/30.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYCollectionViewCell.h"

@class TYDiary;
@interface TYDiaryCollectionCell : TYCollectionViewCell

+ (instancetype)renderCellWithCollectionCell:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath diary:(TYDiary *)diary cell:(TYDiaryCollectionCell *)cell;

@end
