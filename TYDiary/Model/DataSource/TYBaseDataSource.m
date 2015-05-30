//
//  TYBaseDataSource.m
//  TYDiary
//
//  Created by taoYe on 15/5/30.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYBaseDataSource.h"

@implementation TYBaseDataSource

- (instancetype)init {
    if (self = [super init]) {
        _ids = [NSMutableArray array];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
        _ids = [NSMutableArray array];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

- (void)dealloc {
    [TYDebugLog debugFormat:@"%@ -> dealloc"];
}

#pragma mark - Action

- (id)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withIdentifier:(NSString *)identifier forClass:(Class)cellClass {
    id c = [tableView cellForRowAtIndexPath:indexPath];
    if (!c || ![c isKindOfClass:cellClass]) {
        c = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    }
    return c;
}

- (id)elementAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < _ids.count) {
        return _ids[indexPath.row];
    }
    [TYDebugLog error:@"数组越界"];
    return nil;
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    assert(0 && @"子类必须重载");
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    assert(0 && @"子类必须重载");
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tableView:tableView heightForRowAtIndexPath:indexPath];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_ids count];
}


@end
