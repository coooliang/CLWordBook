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
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Major48" ofType:@"csv"];
    NSError *error = nil;
    NSString *fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    NSArray *arr = [fileContents componentsSeparatedByString:@"\n"];
    if(arr && [arr isKindOfClass:NSArray.class] && arr.count > 1){
        for (NSString *line in arr) {
            if(line && line.length > 1){
                NSArray *ws = [line componentsSeparatedByString:@","];
                if(ws.count == 3){
                    NSString *word = ws.firstObject;
                    if([word containsString:@"("] ||[word containsString:@"（"] || [word containsString:@"，"] || [word containsString:@"-"]){
                        NSLog(@"word = %@",word);
                    }
                }else{
                    NSLog(@"error = %@",ws);
                }
            }
        }
    }
}

@end
