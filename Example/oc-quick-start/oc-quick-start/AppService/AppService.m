//// 
//  AppService.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/9/27
//

#import "AppService.h"
#import "HttpService.h"
#import <NSString+YYAdd.h>
#import "Urls.h"

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
    NSString *url = Urls.baiduFanYiApiTranslateUrl;
    NSString *appid = Urls.baiduFanYiAppId;
    NSString *salt = [NSString stringWithFormat:@"%d",arc4random_uniform(10000000)];
    NSString *secretKey = Urls.baiduFanYiSecretKey;
    NSString *sign = [[NSString stringWithFormat:@"%@%@%@%@",appid,q,salt,secretKey]md5String];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:@{@"appid":appid}];
    [parameters setObject:q forKey:@"q"];
    [parameters setObject:@"auto" forKey:@"from"];
    [parameters setObject:@"auto" forKey:@"to"];
    [parameters setObject:salt forKey:@"salt"];
    [parameters setObject:sign forKey:@"sign"];
    NSLog(@"parameters = %@",parameters);
    [[HttpService sharedInstance]post:url parameters:parameters andBlock:^(id result) {
        if(block)block(result);
    }];
}


/*
 {
   "dict": {
     "url": "yddict://m.youdao.com/dict?le=eng&q=%E8%8B%B9%E6%9E%9C"
   },
   "mTerminalDict": {
     "url": "https://m.youdao.com/m/result?lang=zh-CHS&word=%E8%8B%B9%E6%9E%9C"
   },
   "translation": [
     "Apple"
   ],
   "query": "苹果",
   "webdict": {
     "url": "http://mobile.youdao.com/dict?le=eng&q=%E8%8B%B9%E6%9E%9C"
   },
   "basic": {
     "explains": [
       "apple"
     ]
   },
   "tSpeakUrl": "https://openapi.youdao.com/ttsapi?q=Apple&langType=en-USA&sign=E07852B1464D3443C0E894D091DC8C5A&salt=1695880554814&voice=4&format=mp3&appKey=0d867b21d5e939db&ttsVoiceStrict=false&osType=iOS",
   "isWord": true,
   "requestId": "156e05d0-887c-45b6-8162-2a407643afcc",
   "l": "zh-CHS2en",
   "errorCode": "0",
   "web": [
     {
       "value": [
         "Apple",
         "iphone",
         "aapl",
         "IPOD",
         "apple"
       ],
       "key": "苹果"
     },
     {
       "value": [
         "apple inc",
         "Apple",
         "AAPL",
         "Apple Computer"
       ],
       "key": "苹果公司"
     },
     {
       "value": [
         "cider",
         "Calvados",
         "apple wine",
         "Apfelwein"
       ],
       "key": "苹果酒"
     }
   ],
   "speakUrl": "https://openapi.youdao.com/ttsapi?q=%E8%8B%B9%E6%9E%9C&langType=zh-CHS&sign=28B55702B033C1EEC71D3DE95F15E226&salt=1695880554814&voice=4&format=mp3&appKey=0d867b21d5e939db&ttsVoiceStrict=false&osType=iOS",
   "returnPhrase": [
     "苹果"
   ]
 }
 */
- (void)youdao_translate:(NSString *)q andBlock:(void(^)(YDTranslate *translate))block {
    YDTranslateRequest *translateRequest = [YDTranslateRequest request];
    YDTranslateParameters *parameters = [YDTranslateParameters targeting];
    parameters.from = YDLanguageTypeChinese;
    parameters.to = YDLanguageTypeEnglish;
    translateRequest.translateParameters = parameters;
    [translateRequest lookup:q WithCompletionHandler:^(YDTranslateRequest *request, YDTranslate *response, NSError *error) {
        if (error && block) {
            block(nil);
        } else {
            block(response);
        }
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
