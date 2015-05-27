//
//  TYDiary.m
//  TYDiary
//
//  Created by taoYe on 15/5/12.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYDiary.h"

@implementation TYDiary

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

@end
