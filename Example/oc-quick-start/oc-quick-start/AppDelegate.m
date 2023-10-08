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
    self.rootNavigationController = [[UINavigationController alloc]initWithRootViewController:vc];
    self.rootNavigationController.navigationBarHidden = YES;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:self.rootNavigationController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
