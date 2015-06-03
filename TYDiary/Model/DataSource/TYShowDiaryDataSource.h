//
//  TYShowDiaryDataSource.h
//  TYDiary
//
//  Created by taoYe on 15/5/30.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYBaseDataSource.h"

@interface TYShowDiaryDataSource : TYBaseDataSource <UICollectionViewDataSource>

@property (assign, nonatomic) NSInteger year;

- (void)refreshWithMonth:(NSInteger)month action:(TYDoneAction)action;

@end
