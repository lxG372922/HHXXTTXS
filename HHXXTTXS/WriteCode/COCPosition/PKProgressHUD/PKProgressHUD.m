//
//  PKProgressHUD.m
//  pecoo
//
//  Created by AACC on 2018/7/16.
//  Copyright © 2018年 侯航磊. All rights reserved.
//  加载指示器

#import "PKProgressHUD.h"
#import "SVProgressHUD.h"

typedef enum {
    PKProgressHUDTypeSuccess, // 成功
    PKProgressHUDTypeError, // 失败
    PKProgressHUDTypeInfo, // 叹号
    PKProgressHUDTypeOther, // 其它
} PKProgressHUDType;



@implementation PKProgressHUD

/**
 显示普通状态文本：转圈
 @param title 文本
 */
+ (void)pkShowWithStatueTitle:(NSString *)title {
    [self pkDismiss];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:title];
        [self setStyle];
        [self isOpenUserInteractionEnabled:NO];
    });
    
}


/**
 显示普通状态文本：转圈
 @param title 文本
 */
+ (void)pkShowWithStatueTitle:(NSString *)title isOpenUserEnable:(BOOL )isOpenEnable {
    [self pkDismiss];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:title];
        [self setStyle];
        [self isOpenUserInteractionEnabled:isOpenEnable];
    });
    
}

/**
 显示内容： 没有图片的
 
 @param title title
 */
+ (void)pkShowContentTitle:(NSString *)title {
    [self pkShowTitle:title titleState:PKProgressHUDTypeOther isShowIcon:NO completeBlock:nil];
    
}

/**
 显示内容： 没有图片的
 
 @param title title
 @param completeBlock 完成的回调
 */
+ (void)pkShowContentTitle:(NSString *)title completeBlock:(void (^)(void))completeBlock {
    [self pkShowTitle:title titleState:PKProgressHUDTypeOther isShowIcon:NO completeBlock:completeBlock];
}



/**
 显示成功状态文本 默认2s 后隐藏
 @param title 文本
 */
+ (void)pkShowSuccessWithStatueTitle:(NSString *)title {
    [self pkShowTitle:title titleState:PKProgressHUDTypeSuccess isShowIcon:NO completeBlock:nil];
    [self isOpenUserInteractionEnabled:NO];
}

+ (void)pkShowSuccessWithStatueTitle:(NSString *)title completeBlock:(void (^)(void))completeBlock{
    [self pkShowTitle:title titleState:PKProgressHUDTypeSuccess isShowIcon:NO completeBlock:completeBlock];
    [self isOpenUserInteractionEnabled:NO];
}

/**
 显示成功状态文本 默认2s 后隐藏
 @param title 文本
 @param completeBlock 完成的回调
 */
+ (void)pkShowSuccessWithStatueTitle:(NSString *)title isShowIcon:(BOOL )isShowIcon completeBlock:(void (^)(void))completeBlock {
    [self pkShowTitle:title titleState:PKProgressHUDTypeSuccess isShowIcon:isShowIcon completeBlock:completeBlock];
    [self isOpenUserInteractionEnabled:NO];
}

/**
 显示失败状态文本 默认2s 后隐藏
 @param title 文本
 */
+ (void)pkShowErrorWithStatueTitle:(NSString *)title {
    [self pkShowTitle:title titleState:PKProgressHUDTypeError isShowIcon:NO completeBlock:nil];
}

+ (void)pkShowErrorWithStatueTitle:(NSString *)title completeBlock:(void (^)(void))completeBlock{
    
    [self pkShowTitle:title titleState:PKProgressHUDTypeError isShowIcon:NO completeBlock:completeBlock];
}

/**
 显示失败状态文本 默认2s 后隐藏
 @param title 文本
 @param completeBlock 完成的回调
 */
+ (void)pkShowErrorWithStatueTitle:(NSString *)title isShowIcon:(BOOL )isShowIcon completeBlock:(void (^)(void))completeBlock {
      [self pkShowTitle:title titleState:PKProgressHUDTypeError isShowIcon:isShowIcon completeBlock:completeBlock];
}

/**
 显示叹号状态文本 2s 后消失
 @param title 文本
 */
+ (void)pkShowInfoWithStatueTitle:(NSString *)title {
    [self pkShowTitle:title titleState:PKProgressHUDTypeInfo isShowIcon:NO completeBlock:nil];
}
/**
 显示叹号状态文本 2s 后消失
 @param title 文本
 @param completeBlock 完成的回调
 */
+ (void)pkShowInfoWithStatueTitle:(NSString *)title isShowIcon:(BOOL )isShowIcon completeBlock:(void (^)(void))completeBlock {
    [self pkShowTitle:title titleState:PKProgressHUDTypeInfo isShowIcon:isShowIcon completeBlock:completeBlock];
}
/**
 显示叹号状态文本  自定义时间
 @param title 文本
 */
+ (void)pkShowInfoWithStatueTitle:(NSString *)title timer:(CGFloat)timer {
    [self pkDismiss];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showInfoWithStatus:title];
        [self setStyle];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
            [SVProgressHUD setForegroundColor:[UIColor blackColor]];
        });
    });
}
/**
 显示叹号状态文本  自定义时间
 @param title 文本
 @param completeBlock 完成的回调
 */
+ (void)pkShowInfoWithStatueTitle:(NSString *)title timer:(CGFloat)timer completeBlock:(void (^)(void))completeBlock {
   
    [self pkDismiss];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showInfoWithStatus:title];
        [self setStyle];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
            [SVProgressHUD setForegroundColor:[UIColor blackColor]];
        });
        
        if (completeBlock) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                completeBlock();
            });
        }
    });
}



/**
 显示当前进度 默认2s 后隐藏
 @param title 文本
 */
+ (void)pkShowWithProgress:(float )progress {
    [self pkDismiss];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showProgress:progress];
        [self setStyle];
    });
}



/**
 显示弹框样式
 
 @param title 弹框title
 @param type 弹框的类型
 @param isShowIcon 是否显示图片
 @param completeBlock 弹框消失的回调
 */
+ (void)pkShowTitle:(NSString *)title  titleState:(PKProgressHUDType )type  isShowIcon:(BOOL )isShowIcon  completeBlock:(void (^)(void))completeBlock {
    [self pkDismiss];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (isShowIcon) {
            switch (type) {
                case PKProgressHUDTypeSuccess:
                    [SVProgressHUD showSuccessWithStatus:title];
                    break;
                case PKProgressHUDTypeError:
                    [SVProgressHUD showErrorWithStatus:title];
                    break;
                case PKProgressHUDTypeInfo:
                    [SVProgressHUD showInfoWithStatus:title];
                    break;
                    
                default:
                    [SVProgressHUD showInfoWithStatus:title];
                    break;
            }
        }else{
            [SVProgressHUD showImage:[UIImage imageNamed:@""] status:title];
        }
        
        [self setStyle];
        [self afterDimiss];
        
        if (completeBlock) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                completeBlock();
                [self isOpenUserInteractionEnabled:YES];
            });
        }else {
            [self isOpenUserInteractionEnabled:YES];
        }

    });
}



static bool  _isCancel = NO;
/**
 显示可取消的转圈状态
 
 @param title 转圈文案
 */
+ (void)PKShowCanBeCancelStatueTitle:(NSString *)title {
    _isCancel = NO;
    [self pkDismiss];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!_isCancel) {
            [PKProgressHUD pkShowWithStatueTitle:title];
        }
    });
}

/**
 取消显示转圈状态

 @param isCancel 取消
 */
+ (void)PKShowStateIsCancel:(BOOL )isCancel {
    _isCancel = isCancel;
    [self pkDismiss];
}



/**
 * 消失
 */
+ (void)pkDismiss {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [self pkDismissComplete:^{
            
        }];
    });
}

/**
 消失

 @param completeBlock 消失完成的回调
 */
+ (void)pkDismissComplete:(void (^)(void))completeBlock {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        completeBlock();
    });
}


/**
 设置样式
 */
+ (void)setStyle {
    [SVProgressHUD setCornerRadius:5];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
}

/**
 延迟2s 隐藏
 */
+ (void)afterDimiss {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
        [SVProgressHUD setForegroundColor:[UIColor blackColor]];
        
    });
}

+ (void)isOpenUserInteractionEnabled:(BOOL )isOpenEnabled {
    if (isOpenEnabled) {
        
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    }else {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    }
    
}

@end
