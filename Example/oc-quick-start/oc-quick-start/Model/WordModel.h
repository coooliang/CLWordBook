//// 
//  WordModel.h
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/13
//

#import "JKDBModel.h"

@interface WordModel : JKDBModel

@property(nonatomic,strong)NSString *word;
@property(nonatomic,strong)NSString *phonetic;
@property(nonatomic,strong)NSString *translate;

@end
