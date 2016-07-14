//
//  LLBStatusBarHUD.h
//  LLBStatusBarHUD
//
//  Created by LIULUOBIN on 16/7/13.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLBStatusBarHUD : NSObject
/**
 *  显示信息
 */
+(void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 *  显示普通信息
 */
+(void)showMessage:(NSString *)msg;
/**
 *  显示成功信息
 */
+(void)showSuccess:(NSString *)msg;
/**
 *  显示失败信息
 */
+(void)showError:(NSString *)msg;

/**
 *  显示正在处理信息
 */
+(void)showLoading:(NSString *)msg;
/*
 *  隐藏
 */
+(void)hide;
@end
