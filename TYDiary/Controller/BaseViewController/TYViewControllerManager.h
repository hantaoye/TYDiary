//
//  TYViewControllerManager.h
//  TYDiary
//
//  Created by taoYe on 15/5/27.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYObject.h"

@interface TYViewControllerManager : TYObject
+ (void)loadResgiterEntry;

+ (void)loadMainEntry;

+ (void)loadWelcomeViewController;

+ (void)layout;

@end
