//
//  ViewController.m
//  LLBStatusBarHUD
//
//  Created by LIULUOBIN on 16/7/13.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "LLBStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)success:(id)sender {
    [LLBStatusBarHUD showSuccess:@"加载成功。。。"];
}
- (IBAction)error:(id)sender {
    [LLBStatusBarHUD showError:@"加载失败。。。"];
}
- (IBAction)loading:(id)sender {
    [LLBStatusBarHUD showLoading:@"正在加载。。。"];
}
- (IBAction)hide:(id)sender {
    [LLBStatusBarHUD hide];
}
- (IBAction)message:(id)sender {
    [LLBStatusBarHUD showMessage:@"普通文字"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
