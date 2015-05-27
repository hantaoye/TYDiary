//
//  TYLockKeyboardView.m
//  TYDiary
//
//  Created by taoYe on 15/5/27.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYLockKeyboardView.h"

@interface TYLockKeyboardView ()

@property (strong, nonatomic) NSMutableArray *buttons;

@end

@implementation TYLockKeyboardView

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self setActions];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setActions];
    }
    return self;
}

- (void)setActions {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)view;
            [btn addTarget:self action:@selector(pressedBtn:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)pressedBtn:(UIButton *)btn {

}



@end
