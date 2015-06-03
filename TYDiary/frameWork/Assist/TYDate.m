//
//  TYDate.m
//  TYDiary
//
//  Created by taoYe on 15/6/2.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYDate.h"

@implementation TYDate

+ (NSString *)currentDate {
    static NSString *__date;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd";
        __date = [formatter stringFromDate:[NSDate date]];
    });
    return __date;
}

+ (NSInteger)currentYear {
    NSArray *array = [[self currentDate] componentsSeparatedByString:@"-"];
    return [[array firstObject] integerValue];
}

+ (NSInteger)currentMonth {
    NSArray *array = [[self currentDate] componentsSeparatedByString:@"-"];
    return [array[1] integerValue];
}

+ (NSInteger)currentDay {
    NSArray *array = [[self currentDate] componentsSeparatedByString:@"-"];
    return [[array lastObject] integerValue];
}

@end
