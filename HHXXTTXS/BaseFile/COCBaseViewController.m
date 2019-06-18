//
//  COCBaseViewController.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCBaseViewController.h"

#import <objc/message.h>

@interface COCBaseViewController ()


/** 返回按钮 */
@property (strong, nonatomic) UIButton *___backBtn;

/**  返回事件执行者 */
@property (assign, nonatomic) id ___backTarget;

/**  返回事件 */
@property (assign, nonatomic) SEL ___backAction;

@end

@implementation COCBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action {
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.___backBtn];
    if( [[UIDevice currentDevice].systemVersion floatValue] < 11.0) {
        item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"bt_navigation_back_nor"] style:UIBarButtonItemStylePlain target:self action:@selector(p_backBtnAction)];
    }

    self.___backTarget = target;
    
    self.___backAction = action;
    
    return item;
}

#pragma mark - 私有方法 --

/**
 返回按钮事件
 */
- (void)p_backBtnAction {
    
    if (self.shouldBackBlock) {
        
        BOOL isCanBack = self.shouldBackBlock(self.___backBtn);
        
        if (isCanBack && self.___backTarget && [self.___backTarget respondsToSelector:self.___backAction]) {
            // 可返回
            ((void(*)(id,SEL,UIButton *))objc_msgSend)(self.___backTarget,self.___backAction,self.___backBtn);
        }
        
    }else {
        // 可返回
        if (self.___backTarget && [self.___backTarget respondsToSelector:self.___backAction]) {
            ((void(*)(id,SEL,UIButton *))objc_msgSend)(self.___backTarget,self.___backAction,self.___backBtn);
        }
    }
}

#pragma mark - 懒加载 --

- (UIButton *)___backBtn {
    if (!____backBtn) {
        ____backBtn = [[UIButton alloc] init];
        [____backBtn setImage:[UIImage imageNamed:@"bt_navigation_back_nor"] forState:UIControlStateNormal];
        [____backBtn addTarget:self action:@selector(p_backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return ____backBtn;
}

@end
