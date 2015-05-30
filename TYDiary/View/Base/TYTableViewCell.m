//
//  TYTableViewCell.m
//  TYDiary
//
//  Created by taoYe on 15/5/30.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYTableViewCell.h"

@implementation TYTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)dealloc {
    [TYDebugLog debugFormat:@"%@ -> alloc", self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
