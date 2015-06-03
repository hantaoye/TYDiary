//
//  TYDiary.m
//  TYDiary
//
//  Created by taoYe on 15/5/12.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYDiary.h"

@implementation TYDiary

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content imageLocalPath:(NSString *)imageLocalPath year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day wirteTimestamp:(NSString *)wirteTimestamp weaterType:(TYDiaryWeatherType)weatherType temperature:(NSString *)temperature {
    if (self = [super initWithTitle:title content:content imageLocalPath:imageLocalPath year:year month:month day:day wirteTimestamp:wirteTimestamp]) {
        _weatherType = weatherType;
        _temperature = temperature;
    }
        return self;
}

@end
