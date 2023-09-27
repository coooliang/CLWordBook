//// 
//  HttpService.h
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/9/27
//

#import <Foundation/Foundation.h>


@interface HttpService : NSObject

+ (id)sharedInstance;

- (void)post:(NSString *)url parameters:(NSDictionary *)parameters andBlock:(void(^)(id result))block;

@end

