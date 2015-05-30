//
//  TYViewControllerLoader.m
//  TYHomework
//
//  Created by taoYe on 15/3/2.
//  Copyright (c) 2015年 RenYuXian. All rights reserved.
//

#import "TYViewControllerLoader.h"
#import "TYHomeViewController.h"

static NSString *__lockVCIdentifier = @"TYLockViewController";
static NSString *__homeVCIdentifier = @"TYHomeViewController";

@implementation TYViewControllerLoader

+ (TYLockViewController *)lockViewController {
    TYLockViewController *lockViewController = [[self commonStoryboard] instantiateViewControllerWithIdentifier:__lockVCIdentifier];
    return lockViewController;
}

+ (TYHomeViewController *)homeViewController {
    return [[self diaryStroyboard] instantiateViewControllerWithIdentifier:__homeVCIdentifier];
}

+ (UIStoryboard *)welcomeStoryboard {
    static UIStoryboard *stoyrboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stoyrboard = [UIStoryboard storyboardWithName:@"WelcomeViewController" bundle:nil];
    });
    return stoyrboard;
}

+ (UIStoryboard *)commonStoryboard {
    static UIStoryboard *stoyrboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stoyrboard = [UIStoryboard storyboardWithName:@"TYCommonViewController" bundle:nil];
    });
    return stoyrboard;
}

+ (UIStoryboard *)diaryStroyboard {
    static UIStoryboard *stoyrboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stoyrboard = [UIStoryboard storyboardWithName:@"TYBaseDiaryController" bundle:nil];
    });
    return stoyrboard;
}

+ (UIStoryboard *)launchScreenStroyboard {
    static UIStoryboard *stoyrboard = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stoyrboard = [UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil];
    });
    return stoyrboard;
}

@end
