//
//  TYNoteMapper.m
//  TYHomework
//
//  Created by taoYe on 15/4/22.
//  Copyright (c) 2015年 RenYuXian. All rights reserved.
//

#import "TYDiaryMapper.h"
#import <FMDB/FMDB.h>
#import "TYDiary.h"
@implementation TYDiaryMapper

- (id)rowMapperWithResultSet:(FMResultSet *)resultSet {
    NSData *data = [resultSet objectForColumnName:@"diary"];
    TYDiary *diary = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    diary.diaryID = [resultSet intForColumn:@"id"];
    return diary;
}

@end
