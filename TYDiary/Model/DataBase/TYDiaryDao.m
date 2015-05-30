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

//static NSString *TYDiarySQLAddDiary = @"replace into %@ (id, name, avatar) values (?, ?, ?);";

//static NSString *TYDiarySQLRemoveDiary = @"delete from %@ where id = ?";
static NSString *TYDiarySQLUpdateDiary = @"update %@ set title = ?, desc = ? diary = ? where title = ?";

static NSString *TYDiarySQLUpdateDiaryID = @"update %@ set year = ?, month = ?, day = diary = ? where id = ?";

static NSString *TYDiarySQLUpdateDiaryWithNickName = @"update %@ set name = ?, avatar = ?, nickName =? where id = ?";
static NSString *TYDiarySQLGetDiary = @"select id, name, avatar, nickName, timestamp from %@ where id = ?";

static NSString *TYDiarySQLCreateDiary = @"create table if not exists %@(id integer primary key autoincrement, access_token text, userID integer, year integer, month integer, day integer, title text, diary blob)";

static NSString *TYDiarySQLAddDiaryWithName = @"replace into %@ (title, year, month, day, diary) values (?, ?, ?, ?, ?);";


static NSString *TYDiarySQLCheckID = @"select id, diary from %@ where id = ?";

static NSString *TYDiarySQLCheckDay = @"select id, diary from %@ where month = ? && day = ?";
static NSString *TYDiarySQLCheckMonth = @"select id, diary from %@ where month = ? order by day asc";
static NSString *TYDiarySQLCheckYear = @"select id, diary from %@ order by id asc";
static NSString *TYDiarySQLCheckTitle = @"select id, diary from %@ where title = ?";
static NSString *TYDiarySQLMultiGetDiarysTitle = @"select id, diary from %@ where title like %@ order by id asc";
static NSString *TYDiarySQLDeleteDiaryTitle = @"delete from %@ where title = ?";
static NSString *TYDiarySQLDeleteDiaryID = @"delete from %@ where id = ?";

static NSString *TYDBBaseName = @"table_diary";

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

- (NSString *)_tableName {
    static NSString *__tableName = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy";
        NSString *formatter = [dateFormatter stringFromDate:[NSDate date]];
        __tableName = [NSString stringWithFormat:@"%@_%@", TYDBBaseName, formatter];
    });
    [TYDebugLog debugFormat:@"DBName: %@"];
    return __tableName;
}

- (NSString *)composeTableName:(NSInteger)year {
    return [NSString stringWithFormat:@"%@_%ld", TYDBBaseName, (long)year];
}

- (void)createTable {
    [self.connector executeStatements:[NSString stringWithFormat:TYDiarySQLCreateDiary, [self _tableName]]];
}

+ (instancetype)sharedDao {
    return [TYShareStorage shareStorage].diaryDao;
}

- (void)selectDiarysWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day action:(void (^)(TYDiary *))action {
    NSString *tableName = [self composeTableName:year];
    [self.connector queryObjectWithActon:^(id obj) {
        action(obj);
    } rowMapper:[[TYDiaryMapper alloc] init] SQL:[NSString stringWithFormat:TYDiarySQLCheckDay, tableName], month, day];
}

- (void)selectDiarysWithYear:(NSInteger)year month:(NSInteger)month action:(void (^)(NSArray *))action {
    NSString *tableName = [self composeTableName:year];
    NSArray *diarys = [self.connector queryObjectsWithRowMapper:[[TYDiaryMapper alloc] init] SQL:[NSString stringWithFormat:TYDiarySQLCheckMonth, tableName], month];
    return action(diarys);
}

- (void)selectDiarysWithYear:(NSInteger)year action:(void (^)(NSArray *))action {
    NSString *tableName = [self composeTableName:year];
    NSArray *diarys = [self.connector queryObjectsWithRowMapper:[[TYDiaryMapper alloc] init] SQL:[NSString stringWithFormat:TYDiarySQLCheckYear, tableName]];
    return action(diarys);
}

- (void)selectDiaryWithID:(NSInteger)ID year:(NSInteger)year action:(void(^)(TYDiary *diary))action {
    NSString *tableName = [self composeTableName:year];
    [self.connector queryObjectWithActon:^(TYDiary *obj) {
        action(obj);
    } rowMapper:[[TYDiaryMapper alloc] init] SQL:[NSString stringWithFormat:TYDiarySQLCheckID, tableName], ID];
}

- (void)selectDiaryWithTitle:(NSString *)title year:(NSInteger)year action:(void(^)(TYDiary *diary))action {
    NSString *tableName = [self composeTableName:year];
    [self.connector queryObjectWithActon:^(id obj) {
        action(obj);
    } rowMapper:[[TYDiaryMapper alloc] init] SQL:[NSString stringWithFormat:TYDiarySQLCheckTitle, tableName], title];
}

- (void)selectDiarysWithTitle:(NSString *)title year:(NSInteger)year action:(void (^)(NSArray *))action {
    NSString *tableName = [self composeTableName:year];
    NSString *string = [NSString stringWithFormat:@"'%%%@%%'", title];
    NSString *str = [NSString stringWithFormat:TYDiarySQLMultiGetDiarysTitle, tableName, string];
//    [self.connector queryObjectsWithActon:^(NSArray *objs) {
//        action(objs);
//            } rowMapper:[[TYDiaryMapper alloc] init] SQL:str];
   NSArray *array = [self.connector queryObjectsWithRowMapper:[[TYDiaryMapper alloc] init] SQL:str];
    action(array);
}

- (NSArray *)getAllDiarys {
//    return [self.connector queryObjectsWithRowMapper:[[TYDiaryMapper alloc] init] SQL:TYDiarySQLAllDiary];
    return nil;
}

- (void)insertDiaryWithDiary:(TYDiary *)diary year:(NSInteger)year action:(void (^)(NSError * error))action {
    NSString *tableName = [self composeTableName:year];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:diary];
    if ([self.connector updateWithSQL:[NSString stringWithFormat:TYDiarySQLAddDiaryWithName, tableName], diary.title, diary.year, diary.month, diary.date, data]) {
        action(nil);
    } else {
        NSError *error = [NSError errorWithDomain:@"TYDiaryDao" code:-1 userInfo:@{NSLocalizedDescriptionKey : @"insert diary fial"}];
        action(error);
    }
}

- (BOOL)updateDiaryWithDiaryTitle:(NSString *)title year:(NSInteger)year diary:(TYDiary *)diary {
    NSString *tableName = [self composeTableName:year];
   return [self.connector updateWithSQL:[NSString stringWithFormat:TYDiarySQLUpdateDiary, tableName], title, diary.content, diary, title];
}

- (BOOL)updateDiaryWithDiaryID:(NSInteger)ID year:(NSInteger)year diary:(TYDiary *)diary {
    NSString *tableName = [self composeTableName:year];
    return [self.connector updateWithSQL:[NSString stringWithFormat:TYDiarySQLUpdateDiaryID, tableName], diary.year, diary.month, diary.day, diary, ID];
}

- (BOOL)deleteWithDiaryTitle:(NSString *)title year:(NSInteger)year {
    NSString *tableName = [self composeTableName:year];
    return [self.connector updateWithSQL:[NSString stringWithFormat:TYDiarySQLDeleteDiaryTitle, tableName], title];
}

- (BOOL)deleteWithDiaryID:(NSInteger)ID year:(NSInteger)year {
    NSString *tableName = [self composeTableName:year];
    return [self.connector updateWithSQL:[NSString stringWithFormat:TYDiarySQLDeleteDiaryID, tableName], ID];
}


@end
