//// 
//  RootNavigationController.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/8
//

#import "RootTabBarController.h"
#import <RDVTabBarController.h>
#import <RDVTabBarItem.h>
#import "FirstViewController.h"
#import "MyViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    FirstViewController *vc1 = [[FirstViewController alloc]init];
    MyViewController *vc2 = [[MyViewController alloc] init];
    [self setViewControllers:@[vc1, vc2]];
    [self initTabBar];
}

- (void)initTabBar {
    NSArray *tabBarItemImages = @[@"01", @"04"];
    NSArray *titles = @[@"首页",@"我的"];
    [self.tabBar.backgroundView setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar.layer setShadowOffset:CGSizeMake(0, -2)];
    [self.tabBar.layer setShadowOpacity:0.02];
    [self.tabBar.layer setShadowRadius:4];
    [self.tabBar.layer setShadowColor:[UIColor blackColor].CGColor];
    
    [self.tabBar setBackgroundColor:[UIColor clearColor]];
    [self.tabBar setAutoresizingMask:(UIViewAutoresizingFlexibleWidth |
                                  UIViewAutoresizingFlexibleTopMargin |
                                  UIViewAutoresizingFlexibleLeftMargin |
                                  UIViewAutoresizingFlexibleRightMargin |
                                  UIViewAutoresizingFlexibleBottomMargin)];
    NSInteger index = 0;
    for (RDVTabBarItem *item in self.tabBar.items) {
        [item setTitle:[titles objectAtIndex:index]];
        [item setSelectedTitleAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:62 / 255.f green:40 / 255.f blue:255 / 255.f alpha:1.000]}];
        [item setTitlePositionAdjustment:UIOffsetMake(1, 4)];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",[tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",[tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        index++;
    }
}

@end
