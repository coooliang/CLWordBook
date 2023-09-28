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
- (void)baidu_translate:(NSString *)q andBlock:(void(^)(id result))block {
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


/*
 sign = sha256(应用ID+input+salt+curtime+应用密钥)
 */
- (void)youdao_translate:(NSString *)q andBlock:(void(^)(id result))block {
    NSString *url = @"https://openapi.youdao.com/api";
    NSString *from = @"zh";
    NSString *to = @"en";
    NSString *appKey = @"0d867b21d5e939db";
    NSString *salt = [[NSUUID UUID]UUIDString];
    NSString *input = [self youdao_input:appKey query:q];
    NSString *curtime = [NSString stringWithFormat:@"%f",[[NSDate date]timeIntervalSince1970]];//当前UTC时间戳(秒)
    NSString *AppSecret = @"44b33d6932e09dbb86c6e942e018fded9ccb0b7f7de29c24cc498ef9b83877a6";
    NSString *sign = [[NSString stringWithFormat:@"%@%@%@%@%@",appKey,input,salt,curtime,AppSecret]sha256String];
    NSString *signType = @"v3";
    NSString *ext = @"mp3";
    NSString *voice = @"0";
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:0];
    [parameters setObject:q forKey:@"q"];
    [parameters setObject:from forKey:@"from"];
    [parameters setObject:to forKey:@"to"];
    [parameters setObject:appKey forKey:@"appKey"];
    [parameters setObject:salt forKey:@"salt"];
    [parameters setObject:sign forKey:@"sign"];
    [parameters setObject:signType forKey:@"signType"];
    [parameters setObject:curtime forKey:@"curtime"];
    [parameters setObject:ext forKey:@"ext"];
    [parameters setObject:voice forKey:@"voice"];
    NSLog(@"parameters = %@",parameters);
    [[HttpService sharedInstance]post:url parameters:parameters andBlock:^(id result) {
        if(block)block(result);
    }];
}


/*
 其中，input的计算方式为：input=q前10个字符 + q长度 + q后10个字符（当q长度大于20）或 input=q字符串（当q长度小于等于20）；
 */
- (NSString *)youdao_input:(NSString *)appKey query:(NSString *)q{
    if(q && q.length <=20){
        return q;
    }else {
        NSString *frontString = [q substringToIndex:10];
        NSString *backString = [q substringFromIndex:q.length-10];
        NSString *input = [NSString stringWithFormat:@"%@%lu%@",frontString,(unsigned long)q.length,backString];
        return input;
    }
}

@end
