//
//  TYViewControllerLoader.h
//  TYHomework
//
//  Created by taoYe on 15/3/2.
//  Copyright (c) 2015年 RenYuXian. All rights reserved.
//

#import "TYObject.h"
#import <UIKit/UIKit.h>

@class TYLockViewController, TYHomeViewController;

@interface TYViewControllerLoader : TYObject

+ (UIStoryboard *)welcomeStoryboard;

+ (UIStoryboard *)commonStoryboard;

+ (UIStoryboard *)diaryStroyboard;

+ (UIStoryboard *)launchScreenStroyboard;

+ (TYLockViewController *)lockViewController;

+ (TYHomeViewController *)homeViewController;

@end
