//
//  TYDate.h
//  TYDiary
//
//  Created by taoYe on 15/6/2.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYObject.h"

@interface TYDate : TYObject

+ (NSString *)currentDate;
+ (NSInteger)currentYear;
+ (NSInteger)currentMonth;
+ (NSInteger)currentDay;

@end
