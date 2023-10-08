//// 
//  BaseViewController.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/8
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear %@",self.class);
}

- (void)dealloc {
    NSLog(@"dealloc %@",self.class);
}

@end
