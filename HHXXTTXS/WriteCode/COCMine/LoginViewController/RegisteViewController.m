//
//  RegisteViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "RegisteViewController.h"
#import "LoginView.h"
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
    
    _loginV = [[LoginView alloc]initWithFrame:CGRectMake(0, TOP_BAR_HEIGHT, SCREEN_Width, SCREEN_HEIGHT-TOP_BAR_HEIGHT)];
    _loginV.backgroundColor = RGB(150, 150, 151);
    [self.loginV.loginBtn addTarget:self action:@selector(clickRegisteBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_loginV getcreateWithViewFrame:2];
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
    
    LoginAndSaveRegis(self.loginV.userTF.text)
    LoginAndSaveMiMa(self.loginV.passTF.text)
    
     [G_Window showMBHUDAlertWithMessage:@"注册成功" hide:1.5];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
