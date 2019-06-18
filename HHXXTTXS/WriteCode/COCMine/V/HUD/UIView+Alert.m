//
//  UIView+Alert.m
//  BuLuoKe
//
//  Created by 申展铭 on 2018/9/4.
//  Copyright © 2018年 bawei. All rights reserved.
//

#import "UIView+Alert.h"

@implementation UIView (Alert)

MBProgressHUD *_hud = nil;

//使用MBProgressHUD显示提示框
- (void)showMBHUDAlertWithMessage:(NSString *)msg hide:(NSTimeInterval)sec{
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:self];  //self代表调用此方法的UIView对象
    hud.mode = MBProgressHUDModeText;
    hud.labelText = msg;
    hud.removeFromSuperViewOnHide = YES;
    [self addSubview:hud];
    //显示
    [hud show:YES];
    //几秒后消失
    [hud hide:YES afterDelay:sec];
    
}

//显示MBProgressHUD样式菊花控件
- (void)showMBIndicatorView{
    
    //状态栏中的等待指示器
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    //在屏幕正中间出现的第三方菊花
    if(_hud == nil){
        _hud = [[MBProgressHUD alloc]initWithView:self];
    }
    _hud.removeFromSuperViewOnHide = YES;
    [self addSubview:_hud];
    [_hud show:YES];
}

//隐藏MBProgressHUD样式的菊花控件
- (void)hideMBIndicatorView{
    
    //状态栏中的等待指示器
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    //隐藏第三方菊花
    [_hud hide:YES];
    [_hud removeFromSuperview];
    _hud = nil;
}

//使用系统自带的UIAlertController显示文本提示框
- (void)showAlertControllerWithMessage:(NSString *)msg hide:(NSTimeInterval)sec{
    //实例化UIAlertController
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    //通过响应者链得到当前view所在的Controller对象的内存
    [[self viewController] presentViewController:alertC animated:YES completion:nil];
    //延时执行
    [self performSelector:@selector(hideAlertController:) withObject:alertC afterDelay:sec];
}

//通过响应者链找到控制器
- (UIViewController *)viewController{
    UIResponder *res = self;
    do {
        res = [res nextResponder];
        if([res isKindOfClass:[UIViewController class]]){
            return (UIViewController *)res;
        }
    } while (res != nil);
    
    return nil;
}

//隐藏AlertController
- (void)hideAlertController:(UIAlertController *)sender{
    [sender dismissViewControllerAnimated:YES completion:nil];
}

@end







