//
//  PKProgressHUD.h
//  pecoo
//
//  Created by AACC on 2018/7/16.
//  Copyright © 2018年 侯航磊. All rights reserved.
//  状态弹框类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PKProgressHUD : NSObject

/**
 显示普通状态文本：转圈
 @param title 文本
 */
+ (void)pkShowWithStatueTitle:(NSString *)title;


/**
 显示普通状态文本：转圈
 @param title 文本
 */
+ (void)pkShowWithStatueTitle:(NSString *)title isOpenUserEnable:(BOOL )isOpenEnable;

////////////////////////////////////////////////////////////////////////

/**
 显示内容： 没有图片的
 
 @param title title
 */
+ (void)pkShowContentTitle:(NSString *)title;

/**
 显示内容： 没有图片的
 
 @param title title
 @param completeBlock 完成的回调
 */
+ (void)pkShowContentTitle:(NSString *)title completeBlock:(void (^)(void))completeBlock;


////////////////////////////////////////////////////////////////////////

/**
 显示成功状态文本 默认2s 后隐藏
 @param title 文本
 */
+ (void)pkShowSuccessWithStatueTitle:(NSString *)title;

/**
 显示成功状态文本 默认2s 后隐藏

 @param title 文本
 @param completeBlock 完成的回调
 */
+ (void)pkShowSuccessWithStatueTitle:(NSString *)title completeBlock:(void (^)(void))completeBlock;

/**
 显示成功状态文本 默认2s 后隐藏
 @param title 文本
 @param isShowIcon 默认不显示
 @param completeBlock 完成的回调
 */
+ (void)pkShowSuccessWithStatueTitle:(NSString *)title isShowIcon:(BOOL )isShowIcon completeBlock:(void (^)(void))completeBlock;


////////////////////////////////////////////////////////////////////////

/**
 显示失败状态文本 默认2s 后隐藏
 @param title 文本
 */
+ (void)pkShowErrorWithStatueTitle:(NSString *)title;


/**
 显示失败状态文本 默认2s 后隐藏

 @param title 文本
 @param completeBlock 完成的回调
 */
+ (void)pkShowErrorWithStatueTitle:(NSString *)title completeBlock:(void (^)(void))completeBlock;

/**
 显示失败状态文本 默认2s 后隐藏
 @param title 文本
 @param isShowIcon 默认不显示
 @param completeBlock 完成的回调
 */
+ (void)pkShowErrorWithStatueTitle:(NSString *)title isShowIcon:(BOOL )isShowIcon completeBlock:(void (^)(void))completeBlock;

////////////////////////////////////////////////////////////////////////
/**
 显示叹号状态文本 2s 后消失
 @param title 文本
 */
+ (void)pkShowInfoWithStatueTitle:(NSString *)title;

/**
 显示叹号状态文本 2s 后消失
 @param title 文本
 @param isShowIcon 默认不显示
 @param completeBlock 完成的回调
 */
+ (void)pkShowInfoWithStatueTitle:(NSString *)title isShowIcon:(BOOL )isShowIcon completeBlock:(void (^)(void))completeBlock;

/**
 显示叹号状态文本  自定义时间
 @param title 文本
 */
+ (void)pkShowInfoWithStatueTitle:(NSString *)title timer:(CGFloat)timer;

/**
 显示叹号状态文本  自定义时间
 @param title 文本
 @param completeBlock 完成的回调
 */
+ (void)pkShowInfoWithStatueTitle:(NSString *)title timer:(CGFloat)timer completeBlock:(void (^)(void))completeBlock;




////////////////////////////////////////////////////////////////////////

/**
 显示当前进度 默认2s 后隐藏
 @param title 文本
 */
+ (void)pkShowWithProgress:(float )progress;



////////////////////////////////////////////////////////////////////////
#pragma mark -----  可取消状态组begin

/**
 显示可取消的转圈状态
 
 @param title 转圈文案
 */
+ (void)PKShowCanBeCancelStatueTitle:(NSString *)title;

/**
 取消显示转圈状态
 
 @param isCancel 取消
 */
+ (void)PKShowStateIsCancel:(BOOL )isCancel;

#pragma mark -----  可取消状态组end

////////////////////////////////////////////////////////////////////////

/**
 * 消失
 */
+ (void)pkDismiss;

/**
 消失
 
 @param completeBlock 消失完成的回调
 */
+ (void)pkDismissComplete:(void (^)(void))completeBlock;




@end
