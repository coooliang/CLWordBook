//// 
//  RouteUtil.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/8
//

#import "RouteUtil.h"
#import "AppDelegate.h"

@implementation RouteUtil

+ (UINavigationController *)getRootNavigationController {
    AppDelegate *appDelegate = (AppDelegate *)UIApplication.sharedApplication.delegate;
    return appDelegate.rootNavigationController;
}

+ (RootTabBarController *)getRootTabBarController {
    RootTabBarController *root = [self getRootNavigationController].viewControllers.firstObject;
    return root;
}

@end
