//// 
//  AppService.h
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/9/27
//

#import <Foundation/Foundation.h>


@interface AppService : NSObject

+ (id)sharedInstance;

- (void)zh_translate:(NSString *)q andBlock:(void(^)(id result))block;

@end

