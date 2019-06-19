//
//  RegisteViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "RegisteViewController.h"
#import "LoginView.h"
#import "COCHomeServiceViewController.h"
@interface RegisteViewController ()

@property (nonatomic , strong)LoginView *loginV;

@end

@implementation RegisteViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    
    _loginV = [[LoginView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_HEIGHT)];
    _loginV.backgroundColor = RGB(150, 150, 151);
    [self.loginV.loginBtn addTarget:self action:@selector(clickRegisteBtn:) forControlEvents:UIControlEventTouchUpInside];
      [self.loginV.forgetBtn addTarget:self action:@selector(clickForgetBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_loginV getcreateWithViewFrame:2];
    
    [_loginV.protocolInfoBtn addTarget:self action:@selector(p_protocolInfoBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_loginV];
}


-(void)clickRegisteBtn:(UIButton *)sender{
    
    if(self.loginV.userTF.text.length == 0){
        [G_Window showMBHUDAlertWithMessage:@"请输入账号" hide:1.5];
        return;
    }
    
    if(self.loginV.passTF.text.length == 0){
        [G_Window showMBHUDAlertWithMessage:@"请输入密码" hide:1.5];
        return;
    }
    
    if (!self.loginV.protocolBtn.isSelected) {
        [G_Window showMBHUDAlertWithMessage:@"请阅读并同意用户协议" hide:1.5];
        return;
    }
    
    
    LoginAndSaveRegis(self.loginV.userTF.text)
    LoginAndSaveMiMa(self.loginV.passTF.text)
    
     [G_Window showMBHUDAlertWithMessage:@"注册成功" hide:1.5];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)p_protocolInfoBtnAction:(UIButton *)btn {
    
    COCHomeServiceViewController *vc = [[COCHomeServiceViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickForgetBtn:(UIButton *)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
