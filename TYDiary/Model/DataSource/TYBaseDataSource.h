//
//  TYBaseDataSource.h
//  TYDiary
//
//  Created by taoYe on 15/5/30.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYObject.h"

@interface TYBaseDataSource : TYObject <UITableViewDataSource, NSCoding>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *ids;

- (id)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withIdentifier:(NSString *)identifier forClass:(Class)cellClass;

- (id)elementAtIndexPath:(NSIndexPath *)indexPath;

@end
