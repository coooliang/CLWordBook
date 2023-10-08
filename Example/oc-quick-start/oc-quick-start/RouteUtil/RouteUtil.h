//// 
//  RouteUtil.h
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/8
//

#import <Foundation/Foundation.h>
#import "RootTabBarController.h"


@interface RouteUtil : NSObject

+ (UINavigationController *)getRootNavigationController;

+ (RootTabBarController *)getRootTabBarController;

@end

