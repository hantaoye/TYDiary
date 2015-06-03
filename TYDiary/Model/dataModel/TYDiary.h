//
//  TYDiary.h
//  TYDiary
//
//  Created by taoYe on 15/5/12.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYBaseDiary.h"

typedef NS_ENUM(NSInteger, TYDiaryWeatherType) {
    TYDiaryWeatherTypeSunshine, //晴天
    TYDiaryWeatherTypeCloudy,   //阴天
    TYDiaryWeatherTypeCloud     //多云
};

@interface TYDiary : TYBaseDiary <NSCoding>

@property (assign, nonatomic) TYDiaryWeatherType weatherType;

@property (copy, nonatomic) NSString *temperature; //温度

//@property (copy, nonatomic) NSDate *date;

@property (copy, nonatomic) NSString *videopath;

@property (copy, nonatomic) NSString *audioPath;

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content imageLocalPath:(NSString *)imageLocalPath year:(NSInteger)year month:(NSInteger)month day:(NSInteger)day wirteTimestamp:(NSString *)wirteTimestamp weaterType:(TYDiaryWeatherType)weatherType temperature:(NSString *)temperature;

@end
