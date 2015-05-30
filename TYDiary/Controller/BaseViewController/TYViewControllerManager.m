//
//  TYViewControllerManager.m
//  TYDiary
//
//  Created by taoYe on 15/5/27.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYViewControllerManager.h"

@implementation TYViewControllerManager
+ (void)loadRootVC:(UIViewController *)rootVC {
    if (!rootVC) return;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (![NSThread isMainThread]) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            window.rootViewController = rootVC;
            [window makeKeyAndVisible];
        });
    } else {
        window.rootViewController = rootVC;
        [window makeKeyAndVisible];
    }
}

+ (void)loadMainEntry {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"TYHomeViewController" bundle:nil];
    [self loadRootVC:[mainStoryboard instantiateInitialViewController]];
}

+ (void)loadWelcomeViewController {
    UIStoryboard *welcomeStoryboard = [UIStoryboard storyboardWithName:@"WelcomeViewController" bundle:nil];
    [self loadRootVC:[welcomeStoryboard instantiateViewControllerWithIdentifier:@"TYWelcomeViewController"]];
}

+ (void)loadResgiterEntry {
    UIStoryboard *registerStoryboard = [UIStoryboard storyboardWithName:@"RSRegisterViewController" bundle:nil];
    [self loadRootVC:[registerStoryboard instantiateInitialViewController]];
}

+ (void)layout {
    [self loadResgiterEntry];
}

@end
