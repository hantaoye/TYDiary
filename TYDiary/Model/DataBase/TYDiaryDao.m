//
//  TYDiaryDao.m
//  TYHomework
//
//  Created by taoYe on 15/4/22.
//  Copyright (c) 2015年 RenYuXian. All rights reserved.
//

#import "TYDiaryDao.h"
#import "TYShareStorage.h"
#import "TYAccount.h"
#import "TYDatabaseConnector.h"
#import "TYDiaryMapper.h"
#import "TYDiary.h"

static NSString *TYDiarySQLAddDiary = @"replace into table_diary (id, name, avatar) values (?, ?, ?);";

static NSString *TYDiarySQLRemoveDiary = @"delete from table_diary where id = ?";
static NSString *TYDiarySQLUpdateDiary = @"update table_diary set title = ?, desc = ? diary = ? where title = ?";

static NSString *TYDiarySQLUpdateDiaryID = @"update table_diary set title = ?, desc = ? diary = ? where id = ?";

static NSString *TYDiarySQLUpdateDiaryWithNickName = @"update table_diary set name = ?, avatar = ?, nickName =? where id = ?";
static NSString *TYDiarySQLGetDiary = @"select id, name, avatar, nickName, timestamp from table_diary where id = ?";

static NSString *TYDiarySQLCreateDiary = @"create table if not exists table_diary(id integer primary key autoincrement, access_token text, userID integer, title text, desc text, videoPath text, imageURL text, drawImageURL text, timestamp text, diary blob)";

static NSString *TYDiarySQLAddDiaryWithName = @"replace into table_diary (title, desc, videoPath, imageURL, diary) values (?, ?, ?, ?, ?);";

static NSString *TYDiarySQLCheckID = @"select diary from table_diary where id = ?";

static NSString *TYDiarySQLMultiGetDiary = @"select id, diary from table_diary where id in (%@)";

static NSString *TYDiarySQLAllDiary = @"select diary from table_diary order by id asc";
static NSString *TYDiarySQLCheckTitle = @"select id, diary from table_diary where title = ?";
static NSString *TYDiarySQLMultiGetDiarysTitle = @"select id, diary from table_diary where title like %@ order by id asc";
static NSString *TYDiarySQLDeleteDiaryTitle = @"delete from table_diary where title = ?";
static NSString *TYDiarySQLDeleteDiaryID = @"delete from table_diary where id = ?";


@interface TYDiaryDao ()

@property (strong, nonatomic) TYDatabaseConnector *connector;

@end

@implementation TYDiaryDao

- (instancetype)initWithConnector:(TYDatabaseConnector *)dataBaseConnector {
    if (self = [super init]) {
        _connector = dataBaseConnector;
        [self createTable];
    }
    return self;
}

- (void)createTable {
    [self.connector executeStatements:TYDiarySQLCreateDiary];
}

+ (instancetype)sharedDao {
    return [TYShareStorage shareStorage].diaryDao;
}

- (void)selectDiaryWithID:(NSInteger)ID action:(void(^)(TYDiary *diary))action {
    [self.connector queryObjectWithActon:^(TYDiary *obj) {
        action(obj);
    } rowMapper:[[TYDiaryMapper alloc] init] SQL:TYDiarySQLCheckID, ID];
}

- (void)selectDiaryWithTitle:(NSString *)title action:(void(^)(TYDiary *diary))action {
    [self.connector queryObjectWithActon:^(id obj) {
        action(obj);
    } rowMapper:[[TYDiaryMapper alloc] init] SQL:TYDiarySQLCheckTitle, title];
}

- (void)selectDiarysWithTitle:(NSString *)title action:(void (^)(NSArray *))action {
    NSString *string = [NSString stringWithFormat:@"'%%%@%%'", title];
    NSString *str = [NSString stringWithFormat:TYDiarySQLMultiGetDiarysTitle, string];
//    [self.connector queryObjectsWithActon:^(NSArray *objs) {
//        action(objs);
//            } rowMapper:[[TYDiaryMapper alloc] init] SQL:str];
   NSArray *array = [self.connector queryObjectsWithRowMapper:[[TYDiaryMapper alloc] init] SQL:str];
    action(array);
}

- (void)insertDiaryWithID:(NSInteger)ID title:(NSString *)title contentStr:(NSString *)contentStr videoPagth:(NSString *)videoPath imageLocalPath:(NSString *)imageLocalPath audioPath:(NSString *)audioPath action:(void (^)(TYDiary *))action {
    TYDiary *diary = [[TYDiary alloc] init];
    diary.title = title;
    diary.content = contentStr;
    diary.videopath = videoPath;
    diary.imageLocalPath = imageLocalPath;
    diary.audioPath = audioPath;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString *timestamp = [formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:0]];
    diary.wirteTimestamp = timestamp;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:diary];
    if ([self.connector updateWithSQL:TYDiarySQLAddDiaryWithName, title, contentStr, videoPath, imageLocalPath, data]) {
        action(diary);
    } else {
        action(nil);
    }
}

- (BOOL)updateDiaryWithDiaryTitle:(NSString *)title diary:(TYDiary *)diary {
   return [self.connector updateWithSQL:TYDiarySQLUpdateDiary, title, diary.content, diary, title];
}

- (BOOL)updateDiaryWithDiaryID:(NSInteger)ID diary:(TYDiary *)diary {
    return [self.connector updateWithSQL:TYDiarySQLUpdateDiaryID, diary.title, diary.content, diary, ID];
}

- (NSArray *)getAllDiarys {
   return [self.connector queryObjectsWithRowMapper:[[TYDiaryMapper alloc] init] SQL:TYDiarySQLAllDiary];
}

- (BOOL)deleteWithDiaryTitle:(NSString *)title {
    return [self.connector updateWithSQL:TYDiarySQLDeleteDiaryTitle, title];
}

- (BOOL)deleteWithDiaryID:(NSInteger)ID {
    return [self.connector updateWithSQL:TYDiarySQLDeleteDiaryID, ID];
}


@end
