//
//  TYLockKeyboardView.h
//  TYDiary
//
//  Created by taoYe on 15/5/27.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TYLockAction)(NSInteger number);

@interface TYLockKeyboardView : UIView

- (void)setTouchKeyboardAction:(TYLockAction)action;

@end
