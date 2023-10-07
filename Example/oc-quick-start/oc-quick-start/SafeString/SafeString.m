//
//  SafeString.m
//  YinYin
//
//  Created by lion on 2020/12/11.
//  Copyright © 2020 China Industrial Bank. All rights reserved.
//

#import "SafeString.h"

@implementation SafeString


+(NSString *)stringSafe:(id)str{
    id obj = str;
    if (obj == nil || [obj isEqual:[NSNull null]] || [@"null"isEqualToString:obj] || [@"<null>"isEqualToString:obj] || [@"(null)"isEqualToString:obj]) {
        return @"";
    }else{
        return [NSString stringWithFormat:@"%@",obj];
    }
}

+(BOOL)stringIsEmpty:(id)str{
    id obj = str;
    if (obj == nil || [obj isEqual:[NSNull null]] || [@"null"isEqualToString:obj]) {
        return YES;
    }
    return NO;
}

@end
