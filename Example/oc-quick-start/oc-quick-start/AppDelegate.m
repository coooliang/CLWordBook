//// 
//  AppDelegate.m
//  
//  Created by coooliang on 2023/7/6
//

#import "AppDelegate.h"

#import <RDVTabBarController.h>
#import "FirstViewController.h"
#import "MyViewController.h"

#import "RootNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    RootNavigationController *root = [[RootNavigationController alloc]init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:root];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
