//
//  TYBaseDiary.m
//  TYDiary
//
//  Created by taoYe on 15/5/12.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYBaseDiary.h"

@implementation TYBaseDiary

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content imageLocalPath:(NSString *)imageLocalPath year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day wirteTimestamp:(NSString *)wirteTimestamp {
    if (self = [super init]) {
        _title = title;
        _content = content;
        _imageLocalPath = imageLocalPath;
        _year = year;
        _month = month;
        _day = day;
        _wirteTimestamp = wirteTimestamp;
    }
    return self;
}

@end
