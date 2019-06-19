
//
//  LoginView.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "LoginView.h"


@interface LoginView ()<UITextFieldDelegate>

@end


#define NUM @"0123456789"
#define ALPHA @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"


@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgImage];
        [self addSubview:self.logoImage];
        [self addSubview:self.phoneBtn];
        [self addSubview:self.passBtn];
        [self addSubview:self.userTF];
        [self addSubview:self.passTF];
        [self addSubview:self.loginBtn];
        [self addSubview:self.regisBtn];
        [self addSubview:self.forgetBtn];
        [self addSubview:self.userLine];
        [self addSubview:self.passLine];
        [self addSubview:self.protocolBtn];
        [self addSubview:self.protocolInfoBtn];
    }
    return self;
}
- (UIImageView *)bgImage{
    if(!_bgImage){
        _bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _bgImage.image = [UIImage imageNamed:@"bg-1"];
    }
    return _bgImage;
}

- (UIImageView *)logoImage{
    if(!_logoImage){
        _logoImage = [[UIImageView alloc]init];
        _logoImage.backgroundColor = [UIColor redColor];
        _logoImage.image = [UIImage imageNamed:@"logostore_1024pt"];
    }
    return _logoImage;
}
- (UIButton *)phoneBtn{
    if(!_phoneBtn){
        _phoneBtn = [[UIButton alloc]init];
        [_phoneBtn setTitle:@"手机号" forState:UIControlStateNormal];
        _phoneBtn.titleLabel.font = FONT(15);
        _phoneBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_phoneBtn setImage:[UIImage imageNamed:@"qqq"] forState:UIControlStateNormal];
//        _phoneBtn.backgroundColor = [UIColor redColor];
        
        
    }
    return _phoneBtn;
}

- (UIButton *)passBtn{
    if(!_passBtn){
        _passBtn = [[UIButton alloc]init];
        [_passBtn setTitle:@"密码" forState:UIControlStateNormal];
        _passBtn.titleLabel.font = FONT(15);
        _passBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_passBtn setImage:[UIImage imageNamed:@"www"] forState:UIControlStateNormal];
//        _passBtn.backgroundColor = [UIColor redColor];
       
        
    }
    return _passBtn;
}

- (UITextField *)userTF{
    if(!_userTF){
        _userTF = [[UITextField alloc]init];
        _userTF.placeHolder = @"请输入您的手机号";
        _userTF.textColor = RGB(255, 255, 255);
        _userTF.delegate = self;
        [_userTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    return _userTF;
}
- (UILabel *)userLine{
    if(!_userLine){
        _userLine = [[UILabel alloc]init];
        _userLine.backgroundColor = [UIColor whiteColor];
    }
    return _userLine;
}
- (UITextField *)passTF{
    if(!_passTF){
        _passTF = [[UITextField alloc]init];
        _passTF.placeHolder = @"请输入您的密码";
        _passTF.delegate = self;
        _passTF.secureTextEntry = YES;
        _passTF.textColor = RGB(255, 255, 255);
        [_passTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _passTF;
}
- (UILabel *)passLine{
    if(!_passLine){
        _passLine = [[UILabel alloc]init];
        _passLine.backgroundColor =[UIColor whiteColor];
    }
    return _passLine;
}
- (UIButton *)loginBtn{
    if(!_loginBtn){
        _loginBtn  = [[UIButton alloc]init];
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 20;
        _loginBtn.backgroundColor = RGB(18, 44, 50);
    }
    return _loginBtn;
}
- (UIButton *)regisBtn{
    if(!_regisBtn){
        _regisBtn = [[UIButton alloc]init];
        
//        _regisBtn.backgroundColor = [UIColor yellowColor];
        
    }
    return _regisBtn;
}
- (UIButton *)forgetBtn{
    if(!_forgetBtn){
        _forgetBtn = [[UIButton alloc]init];
        _forgetBtn.titleLabel.font = FONT(14);
//        _forgetBtn.backgroundColor = [UIColor yellowColor];
        [_forgetBtn setImage:[UIImage imageNamed:@"bt_navigation_white_nor"] forState:UIControlStateNormal];
    }
    return _forgetBtn;
}

- (UIButton *)protocolBtn {
    if (!_protocolBtn) {
        _protocolBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_protocolBtn setImage:[UIImage imageNamed:@"icon_protocol_sel"] forState:UIControlStateSelected];
        [_protocolBtn setSelected:YES];
        [_protocolBtn setImage:[UIImage imageNamed:@"icon_protocol_nor"] forState:UIControlStateNormal];
        [_protocolBtn addTarget:self action:@selector(p_protocolBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _protocolBtn;
}

- (UIButton *)protocolInfoBtn {
    if (!_protocolInfoBtn) {
        _protocolInfoBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [_protocolInfoBtn setTitleColor:COCColorBackGround forState:UIControlStateNormal];
        
        NSMutableAttributedString *attr = [@" 我已阅读并同意" gl_createAttributedStringWithFont:[UIFont fontWithName:fFont size:12.0f] textColor:COCColorBackGround].mutableCopy;
        
        [attr appendAttributedString:[@"《国际原油期货用户协议》" gl_createAttributedStringWithFont:[UIFont fontWithName:fFont size:14.0f] textColor:[UIColor cyanColor]]];
        
        [_protocolInfoBtn setAttributedTitle:attr forState:UIControlStateNormal];
//        [_protocolInfoBtn addTarget:self action:@selector(p_protocolInfoBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _protocolInfoBtn;
}

- (void)p_protocolBtnAction:(UIButton *)btn {
    
    [self.protocolBtn setSelected:!btn.isSelected];
    
}

-(void)getcreateWithViewFrame:(int)type{
    
    if(type == 1){
        [_logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset((SCREEN_Width- 60)/2);
            make.top.equalTo(self.mas_top).mas_offset(50+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
        }];
        _phoneBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0 - 5 / 2, 0, 0 + 5 / 2);
        _phoneBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0 + 5 / 2, 0, 0 - 5 / 2);
        [_phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(200+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(20);
        }];
        
        [_userTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(230+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(40);
        }];
        
        [_userLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(271+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(1);
        }];
        
        _passBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0 - 5 / 2, 0, 0 + 5 / 2);
        _passBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0 + 5 / 2, 0, 0 - 5 / 2);
        [_passBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(280+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(20);
        }];
        
        [_passTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(310+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(40);
        }];
        
        [_passLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(351+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(1);
        }];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(60);
            make.top.equalTo(self.mas_top).mas_offset(380+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 120);
            make.height.mas_equalTo(40);
        }];
        [_regisBtn setTitle:@"注册账户" forState:UIControlStateNormal];
        _regisBtn.titleLabel.font = FONT(14);
        [_regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).mas_offset(-30);
            make.top.equalTo(self.mas_top).mas_offset(440+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(20);
        }];
        
        [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(20);
            make.top.equalTo(self.mas_top).mas_offset(50);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        
    }else if(type == 2){
        
        [_regisBtn setTitle:@"注册" forState:UIControlStateNormal];
        _regisBtn.titleLabel.font = FONT(17);
        [_regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(20);
            make.top.equalTo(self.mas_top).mas_offset(170+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(20);
        }];
        
        
        _phoneBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0 - 5 / 2, 0, 0 + 5 / 2);
        _phoneBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0 + 5 / 2, 0, 0 - 5 / 2);
        [_phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(200+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(20);
        }];
        
        [_userTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(230+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(40);
        }];
        
        [_userLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(271+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(1);
        }];
        
        _passBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0 - 5 / 2, 0, 0 + 5 / 2);
        _passBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0 + 5 / 2, 0, 0 - 5 / 2);
        [_passBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(280+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(20);
        }];
        
        [_passTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(310+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(40);
        }];
        
        [_passLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(351+TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(1);
        }];
        
        [self.protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.passLine.mas_left);
            make.top.equalTo(self.passLine.mas_bottom).offset(SCALE_Length(20.0f));
            make.size.mas_equalTo(CGSizeMake(18.0f, 18.0f));
        }];
        
        [self.protocolInfoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.protocolBtn.mas_right);
            make.centerY.equalTo(self.protocolBtn.mas_centerY);
        }];
        
        [_loginBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(60);
            make.top.equalTo(self.mas_top).mas_offset(420 +TOP_BAR_HEIGHT);
            make.width.mas_equalTo(SCREEN_Width - 120);
            make.height.mas_equalTo(40);
        }];
        
        [_forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(20);
            make.top.equalTo(self.mas_top).mas_offset(50);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        
    }else if(type == 3){
        [_regisBtn setTitle:@"重置" forState:UIControlStateNormal];
        _regisBtn.titleLabel.font = FONT(17);
        [_regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(20);
            make.top.equalTo(self.mas_top).mas_offset(170);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(20);
        }];
        
        
        _phoneBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0 - 5 / 2, 0, 0 + 5 / 2);
        _phoneBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0 + 5 / 2, 0, 0 - 5 / 2);
        [_phoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(200);
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(20);
        }];
        
        [_userTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(230);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(40);
        }];
        
        [_userLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(40);
            make.top.equalTo(self.mas_top).mas_offset(271);
            make.width.mas_equalTo(SCREEN_Width - 80);
            make.height.mas_equalTo(1);
        }];
        
        [_loginBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(60);
            make.top.equalTo(self.mas_top).mas_offset(300);
            make.width.mas_equalTo(SCREEN_Width - 120);
            make.height.mas_equalTo(40);
        }];
    }
    
    
    
    
}


- (void)textFieldDidChange:(UITextField *)textField{
    
    if(textField == self.userTF){
        if(textField.text.length > 11){
            textField.text = [textField.text substringToIndex:11];
            
        }
    }else if(textField == self.passTF){
        if(textField.text.length > 18){
            
            textField.text = [textField.text substringToIndex:18];
        }
    }
}


// 只能输入字母和数字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField == _userTF){
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:NUM] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }else{
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ALPHANUM] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        return [string isEqualToString:filtered];
    }
    
}


@end
