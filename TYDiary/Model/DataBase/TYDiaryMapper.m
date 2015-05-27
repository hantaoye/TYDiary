//
//  TYNoteMapper.m
//  TYHomework
//
//  Created by taoYe on 15/4/22.
//  Copyright (c) 2015年 RenYuXian. All rights reserved.
//

#import "TYDiaryMapper.h"
#import <FMDB/FMDB.h>
#import "TYNote.h"
@implementation TYDiaryMapper

- (id)rowMapperWithResultSet:(FMResultSet *)resultSet {
    NSData *data = [resultSet objectForColumnName:@"note"];
    TYNote *note = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    note.ID = [resultSet intForColumn:@"id"];
    return note;
}

@end
