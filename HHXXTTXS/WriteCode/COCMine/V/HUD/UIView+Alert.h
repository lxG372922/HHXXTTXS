//
//  UIView+Alert.h
//  BuLuoKe
//
//  Created by 申展铭 on 2018/9/4.
//  Copyright © 2018年 bawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Alert)

//使用MBProgressHUD显示提示框
- (void)showMBHUDAlertWithMessage:(NSString *)msg hide:(NSTimeInterval)sec;
//显示MBProgressHUD样式菊花控件
- (void)showMBIndicatorView;
//隐藏MBProgressHUD样式的菊花控件
- (void)hideMBIndicatorView;
//使用系统自带的UIAlertController显示文本提示框
- (void)showAlertControllerWithMessage:(NSString *)msg hide:(NSTimeInterval)sec;
@end
