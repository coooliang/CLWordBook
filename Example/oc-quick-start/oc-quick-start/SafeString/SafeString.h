//
//  SafeString.h
//  YinYin
//
//  Created by lion on 2020/12/11.
//  Copyright © 2020 China Industrial Bank. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SafeString : NSObject

+(NSString *)stringSafe:(id)str;

+(BOOL)stringIsEmpty:(id)str;

@end

NS_ASSUME_NONNULL_END
