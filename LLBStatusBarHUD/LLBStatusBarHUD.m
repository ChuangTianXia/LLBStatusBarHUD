//
//  LLBStatusBarHUD.m
//  LLBStatusBarHUD
//
//  Created by LIULUOBIN on 16/7/13.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "LLBStatusBarHUD.h"

#define LLBTitleFont [UIFont systemFontOfSize:12]
#define LLBMessageDuration 2.0

/**
 *  全局窗口
 */
static UIWindow *_window;
/**  定时器 */
static NSTimer *_timer;
/** 动画 */
static CGFloat const LLBAnimationDuration = 0.25;


@implementation LLBStatusBarHUD
/**
 *  显示窗口
 */
+(void)showWindow
{
    //fram数据
    CGFloat windowH = 20;
    CGRect fram =  CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    //显示窗口
    _window.hidden = YES;
    _window = [[UIWindow alloc]init];
    _window.frame = fram ;
    _window.windowLevel = UIWindowLevelAlert;
    _window.hidden = NO;
    
    //动画
    fram.origin.y = 0;
    [UIView animateWithDuration:LLBAnimationDuration animations:^{
        _window.frame = fram;
    }];
}
/**
 *  显示信息
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止定时器
    [_timer invalidate];
    
    //显示窗口
    [self showWindow];
    
    //按钮
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [messageBtn setImage:image forState:UIControlStateNormal];
    [messageBtn setTitle:msg forState:UIControlStateNormal];
    if (image){
        messageBtn.titleLabel.font = LLBTitleFont;
        messageBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    messageBtn.frame = _window.bounds;
    [_window addSubview:messageBtn];
    
    //定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:LLBMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}
/**
 *  显示成功信息
 */
+(void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"check"]];
}
/**
 *  显示失败信息
 */
+(void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"error"]];
}

/**
 *  显示正在处理信息
 */
+(void)showLoading:(NSString *)msg
{
    //停止定时器
    [_timer invalidate];
    _timer = nil;
    
    //显示窗口
    [self showWindow];

    //添加文字
    UILabel *titileLab = [[UILabel alloc]init];
    titileLab.frame = _window.bounds;
    titileLab.text = msg;
    titileLab.textColor =[UIColor whiteColor];
    titileLab.font = LLBTitleFont;
    titileLab.textAlignment = NSTextAlignmentCenter;
    [_window addSubview:titileLab];
    
    //添加圈圈
    UIActivityIndicatorView *loadingView =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : LLBTitleFont }].width;
    CGFloat centerX = (_window.frame.size.width - msgW)*0.5 - 20;
    CGFloat cneterY = _window.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, cneterY);
    [_window addSubview:loadingView];
}
/*
 *  隐藏
 */
+(void)hide
{
    [UIView animateWithDuration:LLBAnimationDuration animations:^{
        CGRect fram = _window.frame;
        fram.origin.y = - fram.size.height;
        _window.frame = fram;
    } completion:^(BOOL finished) {
        _window = nil;
        _timer = nil;
    }];
  
}
/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}
@end
