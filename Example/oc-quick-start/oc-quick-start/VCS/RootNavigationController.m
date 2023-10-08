//// 
//  RootNavigationController.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/8
//

#import "RootNavigationController.h"
#import <RDVTabBarController.h>
#import <RDVTabBarItem.h>
#import "FirstViewController.h"
#import "MyViewController.h"

@interface RootNavigationController ()<RDVTabBarDelegate>

@end

@implementation RootNavigationController {
    RDVTabBarController *_tabBarController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *firstViewController = [[FirstViewController alloc]init];
    UIViewController *secondViewController = [[MyViewController alloc] init];
    
    UIViewController *firstNavigationController = [[UINavigationController alloc]initWithRootViewController:firstViewController];
    UIViewController *secondNavigationController = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    _tabBarController = [[RDVTabBarController alloc] init];
    [_tabBarController setViewControllers:@[firstNavigationController, secondNavigationController]];
    [self initTabBar];
    self.viewControllers = @[_tabBarController];
}

- (void)initTabBar {
    NSArray *tabBarItemImages = @[@"01", @"04"];
    NSArray *titles = @[@"首页",@"我的"];
    RDVTabBar *tabBar = [_tabBarController tabBar];
    [tabBar.backgroundView setBackgroundColor:[UIColor whiteColor]];
    [tabBar.layer setShadowOffset:CGSizeMake(0, -2)];
    [tabBar.layer setShadowOpacity:0.02];
    [tabBar.layer setShadowRadius:4];
    [tabBar.layer setShadowColor:[UIColor blackColor].CGColor];
    
    [tabBar setBackgroundColor:[UIColor clearColor]];
    [tabBar setAutoresizingMask:(UIViewAutoresizingFlexibleWidth |
                                  UIViewAutoresizingFlexibleTopMargin |
                                  UIViewAutoresizingFlexibleLeftMargin |
                                  UIViewAutoresizingFlexibleRightMargin |
                                  UIViewAutoresizingFlexibleBottomMargin)];
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 63)];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[_tabBarController tabBar] items]) {
        [item setTitle:[titles objectAtIndex:index]];
        [item setSelectedTitleAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:62 / 255.f green:40 / 255.f blue:255 / 255.f alpha:1.000]}];
        [item setTitlePositionAdjustment:UIOffsetMake(1, 4)];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",[tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",[tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        index++;
    }
}


#pragma mark - RDVTabBarDelegate
- (BOOL)tabBar:(RDVTabBar *)tabBar shouldSelectItemAtIndex:(NSInteger)index {
    return YES;
}

- (void)tabBar:(RDVTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index {
    
}

@end
