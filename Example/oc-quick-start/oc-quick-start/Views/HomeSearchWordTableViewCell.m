//// 
//  HomeSearchWordTableViewCell.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/12
//

#import "HomeSearchWordTableViewCell.h"
#import <UIColor+YYAdd.h>

@implementation HomeSearchWordTableViewCell {
    UILabel *_wordLabel;
    UILabel *_translateLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setFrame:CGRectMake(0, 0, WIDTH, 60)];
        [self setBackgroundColor:[UIColor whiteColor]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initializeView];
    }
    return self;
}

-(void)initializeView {
    _wordLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, WIDTH-40, 60)];
    _wordLabel.text = @"wreck wreck";
    _wordLabel.font = [UIFont boldSystemFontOfSize:12];
    _wordLabel.textColor = UIColor.blackColor;
    [_wordLabel sizeToFit];
    _wordLabel.frame = CGRectMake(20, (60-CGRectGetHeight(_wordLabel.frame))/2, CGRectGetWidth(_wordLabel.frame), CGRectGetHeight(_wordLabel.frame));
    [self.contentView addSubview:_wordLabel];
    _translateLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_wordLabel.frame)+5, 0, WIDTH-CGRectGetMaxX(_wordLabel.frame)-10, 60)];
    _translateLabel.text = @"n. 1. 失事的船只，残骸 2. 破灭，毁坏 v. 摧毁，破坏";
    _translateLabel.font = [UIFont systemFontOfSize:12];
    _translateLabel.textColor = [UIColor colorWithHexString:@"a1a1a1"];
    [self.contentView addSubview:_translateLabel];
    
}

@end
