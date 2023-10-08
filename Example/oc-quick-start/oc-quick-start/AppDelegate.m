//// 
//  AppDelegate.m
//  
//  Created by coooliang on 2023/7/6
//

#import "AppDelegate.h"
#import "RootTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    RootTabBarController *vc = [[RootTabBarController alloc]init];
    UINavigationController *root = [[UINavigationController alloc]initWithRootViewController:vc];
    root.navigationBarHidden = YES;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:root];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
