//// 
//  FirstViewController.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/8
//

#import "FirstViewController.h"
#import <UIColor+YYAdd.h>

@interface FirstViewController ()<UITextFieldDelegate>

@end

@implementation FirstViewController {
    UIView *_searchBar;
    UIImageView *_searchIcon;
    UITextField *_searchTextField;
    
    UIColor *_backgroundColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundColor = [UIColor colorWithHexString:@"e6e7fc"];
    self.view.backgroundColor = _backgroundColor;
    [self createTextField];
}

- (void)createTextField {
    _searchBar = [[UIView alloc] initWithFrame:CGRectMake(20, STATUS_BAR_HEIGHT, WIDTH - 40, 60)];
    _searchBar.backgroundColor = _backgroundColor;
    _searchBar.layer.borderColor = [UIColor colorWithHexString:@"9d9cef"].CGColor;
    _searchBar.layer.borderWidth = 2;
    _searchBar.layer.cornerRadius = 10;
    _searchBar.layer.masksToBounds = YES;
    [self.view addSubview:_searchBar];
    
    _searchIcon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 8.5, 13, 13)];
    _searchIcon.image = [UIImage imageNamed:@"search_magnifier_gray"];
    [_searchBar addSubview:_searchIcon];
    
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_searchIcon.frame)+6, 0, _searchBar.frame.size.width-CGRectGetMaxX(_searchIcon.frame)-12, CGRectGetHeight(_searchBar.frame))];
    _searchTextField.backgroundColor = _backgroundColor;
    _searchTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _searchTextField.font = [UIFont systemFontOfSize:14];
    _searchTextField.placeholder = @"请输入单词";
    _searchTextField.textColor = [UIColor colorWithHexString:@"8992d2"];
    _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _searchTextField.returnKeyType = UIReturnKeySearch;
    _searchTextField.delegate = self;
    [_searchBar addSubview:_searchTextField];
    
    [_searchTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

-(void)textFieldDidChange:(UITextField *)textField{
    
}

@end
