//// 
//  MyViewController.m
//  oc-quick-start
//  Created by ___ORGANIZATIONNAME___ on 2023/10/8
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.blueColor;
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"GRE_8000_Words" ofType:@"csv"];
    NSError *error = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    NSArray *arr = [fileContents componentsSeparatedByString:@"\r\n"];
    NSLog(@"arr = %@",arr);
}


@end
