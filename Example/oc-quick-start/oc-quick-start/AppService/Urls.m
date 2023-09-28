//// 
//  Urls.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/9/28
//

#import "Urls.h"

@implementation Urls

#pragma mark - baidu
+ (NSString *)baiduFanYiApiTranslateUrl {
    return  @"https://fanyi-api.baidu.com/api/trans/vip/translate";
}

+ (NSString *)baiduFanYiAppId {
    return @"20230927001831390";
}

+ (NSString *)baiduFanYiSecretKey {
    return @"VceAhYoDKdQqOICISUza";
}

#pragma mark - youdao
+ (NSString *)youdaoVoiceAudioUrl {
    return  @"https://dict.youdao.com/dictvoice?audio=%@&type=2";
}
@end
