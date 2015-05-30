//
//  TYBaseDiary.h
//  TYDiary
//
//  Created by taoYe on 15/5/12.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYObject.h"

@interface TYBaseDiary : TYObject <NSCoding>

@property (copy, nonatomic) NSString *title;

@property (copy, nonatomic) NSString *content;

@property (copy, nonatomic) NSString *imageLocalPath;//图片路径， 本地

@property (copy, nonatomic) NSString *tagString;

@property (assign, nonatomic) long long diaryID;

@property (copy, nonatomic) NSString *wirteTimestamp;//写入日期

@property (assign, nonatomic) NSInteger year;

@property (assign, nonatomic) NSInteger month;

@property (assign, nonatomic) NSInteger day;

@end
