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

- (void)selectNoteWithID:(NSInteger)ID action:(void(^)(TYDiary *note))action;

- (void)selectNoteWithTitle:(NSString *)title action:(void(^)(TYDiary *note))action;

- (void)selectNotesWithTitle:(NSString *)title action:(void (^)(NSArray *notes))action;

- (void)insertDiaryWithID:(NSInteger)ID title:(NSString *)title contentStr:(NSString *)contentStr videoPagth:(NSString *)videoPath imageURL:(NSString *)imageURL drawImageURL:(NSString *)drawImageURL audioURL:(NSString *)audioURL action:(void (^)(TYDiary *))action ;

- (BOOL)deleteWithNoteTitle:(NSString *)title;

- (BOOL)deleteWithNoteID:(NSInteger)ID;

- (BOOL)updateNoteWithNoteTitle:(NSString *)title note:(TYDiary *)note;
- (BOOL)updateNoteWithNoteID:(NSInteger)ID note:(TYDiary *)note;

- (NSArray *)getAllNotes;

@end
