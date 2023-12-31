//// 
//  AppService.h
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/9/27
//

#import <Foundation/Foundation.h>
#import "TranslateSDK.h"

@interface AppService : NSObject

+ (id)sharedInstance;

- (void)baidu_translate:(NSString *)q andBlock:(void(^)(id result))block;

- (void)youdao_translate:(NSString *)q andBlock:(void(^)(YDTranslate *translate))block;

@end

