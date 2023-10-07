//// 
//  WordStore.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/7
//

#import "WordStore.h"
#import <YYCache.h>

static NSString * const WordStoreYYCache = @"WordStoreYYCache";
@implementation WordStore {
    YYCache *_yyCache;
}

+ (id)sharedInstance {
    static WordStore *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        NSString *cacheFolder = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        NSString *path = [cacheFolder stringByAppendingPathComponent:WordStoreYYCache];
        _yyCache = [YYCache cacheWithPath:path];
    }
    return self;
}

- (void)setObject:(id)value forKey:(NSString *)key {
    [_yyCache setObject:value forKey:key];
}


- (id)objectForKey:(NSString *)key {
    return [_yyCache objectForKey:key];
}
@end
