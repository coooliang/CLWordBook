//// 
//  WordStore.h
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/7
//

#import <Foundation/Foundation.h>

@interface WordStore : NSObject

+ (id)sharedInstance;

- (void)setObject:(id)value forKey:(NSString *)key;

- (id)objectForKey:(NSString *)key;

@end
