//
//  TYHomeMonthBar.m
//  TYDiary
//
//  Created by taoYe on 15/5/25.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#define TYHomeAddButtonWH 50

#import "TYHomeMonthBar.h"

@interface TYHomeMonthBar ()

@property (strong, nonatomic) NSMutableArray *monthArray;

@property (weak, nonatomic) UIButton *addBtn;


@end


@implementation TYHomeMonthBar

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self setupData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupData];
    }
    return self;
}

- (void)setupData {
    _monthArray = [NSMutableArray array];
    for (int idx = 0; idx < 12; idx++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor clearColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:[NSString stringWithFormat:@"%d", idx + 1] forState:UIControlStateNormal];
        btn.tag = idx;
        [btn addTarget:self action:@selector(pressedMonthButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        [_monthArray addObject:btn];
    }
}

- (void)pressedMonthButton:(UIButton *)button {
    
}

- (void)pressedAddButton:(UIButton *)button {
    
}

- (void)setAddButton {
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn addTarget:self action:@selector(pressedAddButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:addBtn];
    [addBtn setImage:nil forState:UIControlStateNormal];
    [addBtn setImage:nil forState:UIControlStateHighlighted];
    
    _addBtn = addBtn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = (self.bounds.size.width / _monthArray.count) - TYHomeAddButtonWH;
    for (int idx = 0; idx < _monthArray.count; idx++) {
        UIButton *btn = _monthArray[idx];
        if (idx < _monthArray.count / 2) {
            btn.frame = CGRectMake(width * idx, 0, width, self.bounds.size.height);
        } else {
            btn.frame = CGRectMake(width * idx + TYHomeAddButtonWH, 0, width, self.bounds.size.height);
        }
    }
    _addBtn.bounds = CGRectMake(0, 0, TYHomeAddButtonWH, TYHomeAddButtonWH);
    _addBtn.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
}

@end
