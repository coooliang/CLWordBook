//// 
//  HttpService.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/9/27
//

#import "HttpService.h"
#import <AFNetworking.h>

@implementation HttpService {
    AFHTTPSessionManager *_afManager;
}


//单例
+ (id)sharedInstance {
    static HttpService *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        [self createAFManger];
    }
    return self;
}

- (void)createAFManger {
    _afManager = [AFHTTPSessionManager manager];
    _afManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    _afManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [_afManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    _afManager.requestSerializer.timeoutInterval = 20;
    [_afManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
}

- (void)post:(NSString *)url parameters:(NSDictionary *)parameters andBlock:(void(^)(id result))block {
    [_afManager POST:url parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableString *string = [[NSMutableString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSString *rs = [self stringByReplaceUnicode:string];
        if(block)block(rs);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(block)block(nil);
    }];
}


- (NSString *)stringByReplaceUnicode:(NSString *)string {
    NSMutableString *convertedString = [string mutableCopy];
    [convertedString replaceOccurrencesOfString:@"\\U"
                                     withString:@"\\u"
                                        options:0
                                          range:NSMakeRange(0, convertedString.length)];
    CFStringRef transform = CFSTR("Any-Hex/Java");
    CFStringTransform((__bridge CFMutableStringRef)convertedString, NULL, transform, YES);
    return convertedString;
}

@end
