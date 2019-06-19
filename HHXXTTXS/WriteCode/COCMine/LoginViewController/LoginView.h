//
//  LoginView.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : UIView

@property (nonatomic , strong)UIImageView *bgImage;

@property (nonatomic , strong)UIImageView *logoImage;

@property (nonatomic , strong)UIButton *phoneBtn;

@property (nonatomic , strong)UIButton *passBtn;

@property (nonatomic , strong)UITextField *userTF;

@property (nonatomic , strong)UILabel *userLine;

@property (nonatomic , strong)UITextField *passTF;

@property (nonatomic , strong)UILabel *passLine;

@property (nonatomic , strong)UIButton *loginBtn;

@property (nonatomic , strong)UIButton *regisBtn;

@property (nonatomic , strong)UIButton *forgetBtn;

/** 协议选中按钮 */
@property (strong, nonatomic) UIButton *protocolBtn;

/** 协议按钮 */
@property (strong, nonatomic) UIButton *protocolInfoBtn;

-(void)getcreateWithViewFrame:(int)type;


@end

NS_ASSUME_NONNULL_END
