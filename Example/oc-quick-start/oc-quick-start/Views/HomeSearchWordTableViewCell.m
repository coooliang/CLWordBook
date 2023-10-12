//// 
//  HomeSearchWordTableViewCell.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/12
//

#import "HomeSearchWordTableViewCell.h"
#import <UIColor+YYAdd.h>

@implementation HomeSearchWordTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setFrame:CGRectMake(0, 0, WIDTH, 60)];
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initializeView];
    }
    return self;
}

-(void)initializeView {
    UILabel *wordLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+5, 0, WIDTH-CGRectGetMaxX(imageView.frame)-10, 60)];
    wordLabel.text = @"wreck";
    wordLabel.font = [UIFont systemFontOfSize:12];
    wordLabel.textColor = [UIColor colorWithHexString:@"a1a1a1"];
    [self.contentView addSubview:wordLabel];
    UILabel *translateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame)+5, 0, WIDTH-CGRectGetMaxX(imageView.frame)-10, 60)];
    translateLabel.text = @"n. 1. 失事的船只，残骸 2. 破灭，毁坏 v. 摧毁，破坏";
    translateLabel.font = [UIFont systemFontOfSize:12];
    translateLabel.textColor = [UIColor colorWithHexString:@"a1a1a1"];
    [self.contentView addSubview:translateLabel];
    
}

@end
