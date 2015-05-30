//
//  TYDiaryDao.h
//  TYHomework
//
//  Created by taoYe on 15/4/22.
//  Copyright (c) 2015年 RenYuXian. All rights reserved.
//

#import "TYObject.h"

@class TYDatabaseConnector, TYDiary;
@interface TYDiaryDao : TYObject
- (instancetype)initWithConnector:(TYDatabaseConnector *)dataBaseConnector;

+ (instancetype)sharedDao;

- (void)selectDiarysWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day action:(void(^)(TYDiary *diary))action;
- (void)selectDiarysWithYear:(NSInteger)year month:(NSInteger)month action:(void (^)(NSArray *diarys))action;
- (void)selectDiarysWithYear:(NSInteger)year action:(void (^)(NSArray *diarys))action;

- (void)selectDiaryWithID:(NSInteger)ID year:(NSInteger)year action:(void(^)(TYDiary *diary))action;

- (void)selectDiaryWithTitle:(NSString *)title year:(NSInteger)year action:(void(^)(TYDiary *diary))action;

- (void)selectDiarysWithTitle:(NSString *)title year:(NSInteger)year action:(void (^)(NSArray *))action;

- (void)insertDiaryWithDiary:(TYDiary *)diary year:(NSInteger)year action:(void (^)(NSError * error))action;

- (BOOL)deleteWithDiaryTitle:(NSString *)title year:(NSInteger)year;

- (BOOL)deleteWithDiaryID:(NSInteger)ID year:(NSInteger)year;

- (BOOL)updateDiaryWithDiaryTitle:(NSString *)title year:(NSInteger)year diary:(TYDiary *)diary;

- (BOOL)updateDiaryWithDiaryID:(NSInteger)ID year:(NSInteger)year diary:(TYDiary *)diary;

- (NSArray *)getAllDiarys;

@end
