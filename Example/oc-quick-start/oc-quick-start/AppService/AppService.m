//// 
//  AppService.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/9/27
//

#import "AppService.h"
#import "HttpService.h"
#import <NSArray+YYAdd.h>
#import <NSString+YYAdd.h>

@implementation AppService

//单例
+ (id)sharedInstance {
    static AppService *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}


/*
 parameters = {
     appid = 20230927001831390;
     from = zh;
     q = "苹果";
     salt = 0;
     sign = 23e8c6bc04d50a54e652983d85805943;
     to = en;
 }
 result = {"from":"zh","to":"en","trans_result":[{"src":"\u82f9\u679c","dst":"apple"}]}


 */
- (void)zh_translate:(NSString *)q andBlock:(void(^)(id result))block {
    NSString *url = @"https://fanyi-api.baidu.com/api/trans/vip/translate";
    NSString *appid = @"20230927001831390";
    NSString *salt = [NSString stringWithFormat:@"%d",arc4random_uniform(10000000)];
    NSString *secretKey = @"VceAhYoDKdQqOICISUza";
    NSString *sign = [[NSString stringWithFormat:@"%@%@%@%@",appid,q,salt,secretKey]md5String];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:@{@"appid":appid}];
    [parameters setObject:q forKey:@"q"];
    [parameters setObject:@"zh" forKey:@"from"];
    [parameters setObject:@"en" forKey:@"to"];
    [parameters setObject:salt forKey:@"salt"];
    [parameters setObject:sign forKey:@"sign"];
    NSLog(@"parameters = %@",parameters);
    [[HttpService sharedInstance]post:url parameters:parameters andBlock:^(id result) {
        if(block)block(result);
    }];
}

@end
