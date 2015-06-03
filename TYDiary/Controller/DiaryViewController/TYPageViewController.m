//
//  TYPageViewController.m
//  TYDiary
//
//  Created by taoYe on 15/6/2.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYPageViewController.h"
#import "TYShowDiaryViewController.h"
#import "TYViewControllerLoader.h"
#import "TYDate.h"
#import "RSOptions.h"

@interface TYPageViewControllerDataSource : NSObject <UIPageViewControllerDataSource>
@property (strong, nonatomic) NSMutableArray *viewControllers;

@property (assign, nonatomic) NSInteger month;

@end

@implementation TYPageViewControllerDataSource

- (instancetype)init {
    if (self = [super init]) {
        [self _setup];
    }
    return self;
}

- (void)_setup {
    _viewControllers = [NSMutableArray array];
    for (int idx = 0; idx < 3; idx++) {
        [_viewControllers addObject:[TYViewControllerLoader showDiaryViewController]];
    }
    _month = [TYDate currentMonth];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (_month == 1) {
        return nil;
    } else {
        return _viewControllers[0];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (_month == 12) {
        return nil;
    } else {
        return _viewControllers[2];
    }
}

@end

@interface TYPageViewController ()

@end

@implementation TYPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    TYPageViewControllerDataSource *ds = (TYPageViewControllerDataSource *)[self dataSource];
    [self setViewControllers:@[[ds viewControllers][1]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [[self view] setBackgroundColor:[[RSOptions option] grayTableViewBackgroundColor]];
    
}

- (void)dealloc {
    NSLog(@"%@ -> dealloc", self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    TYPageViewControllerDataSource *ds = (TYPageViewControllerDataSource *)[self dataSource];
    NSInteger idx = [[ds viewControllers] indexOfObject:[[pageViewController viewControllers] firstObject]];
    NSLog(@"idx ==== %ld", idx);
    if (idx != NSNotFound) {
        if (idx == 0) {
            ds.month--;
            TYShowDiaryViewController *VC = [ds.viewControllers lastObject];
            [ds.viewControllers removeObject:VC];
            [ds.viewControllers insertObject:VC atIndex:0];
        } else if (idx == 2) {
            ds.month++;
            TYShowDiaryViewController *VC = [ds.viewControllers firstObject];
            [ds.viewControllers removeObject:VC];
            [ds.viewControllers addObject:VC];
        }
    }
}

@end
