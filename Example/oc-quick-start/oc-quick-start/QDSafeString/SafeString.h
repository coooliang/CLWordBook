//
//  SafeString.h
//  YinYin
//
//  Created by lion on 2020/12/11.
//  Copyright © 2020 China Industrial Bank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QDSafeString : NSObject

+(NSString *)stringSafe:(id)str;

+(BOOL)stringIsEmpty:(id)str;

@end

