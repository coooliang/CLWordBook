//// 
//  FirstViewController.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/8
//

#import "FirstViewController.h"
#import <UIColor+YYAdd.h>
#import "RouteUtil.h"
#import "HomeSearchWordTableViewCell.h"

@interface FirstViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation FirstViewController {
    UIView *_searchBar;
    UIImageView *_searchIcon;
    UITextField *_searchTextField;
    
    UIColor *_backgroundColor;
    
    UITableView *_tableView;
    
    NSMutableArray *_datas;
}

#pragma mark - live cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    _backgroundColor = [UIColor colorWithHexString:@"e6e7fc"];
    self.view.backgroundColor = _backgroundColor;
    [self createTextField];
    
    _datas = [NSMutableArray arrayWithArray:@[@"apple",@""]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if(!_tableView) [self createTableView];
}

#pragma mark - create views
- (void)createTableView {
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_searchBar.frame), WIDTH, HEIGHT-CGRectGetMaxY(_searchBar.frame)-[RouteUtil getRootTabBarController].tabBar.frame.size.height)];
    _tableView.backgroundColor = UIColor.redColor;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)createTextField {
    _searchBar = [[UIView alloc]initWithFrame:CGRectMake(20, STATUS_BAR_HEIGHT, WIDTH - 40, 60)];
    _searchBar.backgroundColor = _backgroundColor;
    _searchBar.layer.borderColor = [UIColor colorWithHexString:@"9d9cef"].CGColor;
    _searchBar.layer.borderWidth = 2;
    _searchBar.layer.cornerRadius = 10;
    _searchBar.layer.masksToBounds = YES;
    [self.view addSubview:_searchBar];
    
    _searchIcon = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 20, 20)];
    _searchIcon.image = [UIImage imageNamed:@"search"];
    [_searchBar addSubview:_searchIcon];
    
    _searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_searchIcon.frame)+6, 0, _searchBar.frame.size.width-CGRectGetMaxX(_searchIcon.frame)-12, CGRectGetHeight(_searchBar.frame))];
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

#pragma mark -
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeSearchWordTableViewCell *cell = [[HomeSearchWordTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(HomeSearchWordTableViewCell.class)];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}
- (void)textFieldDidChange:(UITextField *)textField {
    if(textField.markedTextRange == nil){
        NSLog(@"textField text = %@",textField.text);
    }
}

@end
