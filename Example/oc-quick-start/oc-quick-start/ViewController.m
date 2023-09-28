//// 
//  ViewController.m
//  
//  Created by coooliang on 2023/7/6
//

#import "ViewController.h"
#import "AppService.h"
#import <SVProgressHUD.h>
#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>
#import <YYKit.h>
#import "Urls.h"

@interface ViewController ()

@property (nonatomic, strong) AVAudioPlayer *player; //播放器

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *testButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    [testButton setTitle:@"test" forState:UIControlStateNormal];
    [testButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:testButton];
    [testButton addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *testButton2 = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 40)];
    [testButton2 setTitle:@"test2" forState:UIControlStateNormal];
    [testButton2 setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:testButton2];
    [testButton2 addTarget:self action:@selector(test2) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)test {
    [SVProgressHUD show];
    [[AppService sharedInstance]baidu_translate:@"海象" andBlock:^(id result) {
        [SVProgressHUD dismiss];
        NSLog(@"result = %@",result);//result = {"from":"zh","to":"en","trans_result":[{"src":"苹果","dst":"apple"}]}
        NSDictionary *dict = [result jsonValueDecoded];
        if(dict && [dict isKindOfClass:NSDictionary.class]){
            NSArray *trans = [dict objectForKey:@"trans_result"];
            if(trans && [dict isKindOfClass:NSArray.class] && trans.count > 0){
                NSDictionary *rs = trans.firstObject;
                if([rs isKindOfClass:NSDictionary.class]){
                    NSString *dst = [rs objectForKey:@"dst"];
                    NSString *audioUrl = [NSString stringWithFormat:Urls.youdaoVoiceAudioUrl,dst];
                    NSLog(@"audioUrl = %@",audioUrl);
                    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:audioUrl]];
                    NSURLSession *session = [NSURLSession sharedSession];
                    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                        self.player = [[AVAudioPlayer alloc] initWithData:data error:nil];
                        [self.player play];
                    }];
                    [task resume];
                }
            }
        }
    }];
}

- (void)test2 {
    //初始化appKey(应用ID)
    YDTranslateInstance *yd = [YDTranslateInstance sharedInstance];
    yd.appKey = @"0d867b21d5e939db";
    [SVProgressHUD show];
    [[AppService sharedInstance]youdao_translate:@"苹果" andBlock:^(YDTranslate *translate) {
        [SVProgressHUD dismiss];
        NSLog(@"result = %@",[translate.json modelToJSONString]);
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://dict.youdao.com/dictvoice?audio=apple&type=2"]];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            self.player = [[AVAudioPlayer alloc] initWithData:data error:nil];
            [self.player play];
        }];
        [task resume];
    }];
}

@end



