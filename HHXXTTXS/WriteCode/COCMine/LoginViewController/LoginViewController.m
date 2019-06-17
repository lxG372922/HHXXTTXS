//
//  LoginViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisteViewController.h"
#import "ForgetViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic , strong)LoginView *loginV;


@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _loginV = [[LoginView alloc]initWithFrame:CGRectMake(0, TOP_BAR_HEIGHT, SCREEN_Width, SCREEN_HEIGHT - TOP_BAR_HEIGHT)];
    _loginV.backgroundColor = RGB(150, 150, 151);
    _loginV.userTF.delegate = self;
    [_loginV getcreateWithViewFrame:1];
    
    [self.loginV.loginBtn addTarget:self action:@selector(clickLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginV.regisBtn addTarget:self action:@selector(clickRegisBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginV.forgetBtn addTarget:self action:@selector(clickForgetBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_loginV];
    
}
//登录
-(void)clickLoginBtn:(UIButton *)sender
{
    BOOL isOne = [_loginV.userTF.text isEqualToString:@"15018320041"] && [_loginV.passTF.text isEqualToString:@"1234"];
    BOOL isTwo = [_loginV.userTF.text isEqualToString:UserRegis] && [_loginV.passTF.text isEqualToString:UserMiMa];
    
    NSLog(@"%@   %@",UserRegis,UserMiMa);
    if(isOne || isTwo){
        [G_Window showMBHUDAlertWithMessage:@"登录成功" hide:2.0];
        [self.navigationController popViewControllerAnimated:YES];
        LoginAndSaveUid(_loginV.userTF.text);
        NSLog(@"---%@",UserId);
    }else{
        
//       弹出“请检查用户名和密码是否为空！”对话框
        [G_Window showMBHUDAlertWithMessage:@"请检查输入的账号或密码是否正确!" hide:2.0];
//        [self showError:@"请检查输入的账号或密码是否正确!"];
    }
//    if(){
//        [G_Window showMBHUDAlertWithMessage:@"登录成功" hide:2.0];
//        [self.navigationController popViewControllerAnimated:YES];
//        LoginAndSaveRegis(_loginV.userTF.text);
//
//    }else{
//        [G_Window showMBHUDAlertWithMessage:@"请检查输入的账号或密码是否正确!" hide:2.0];
//    }
    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



//注册
-(void)clickRegisBtn:(UIButton *)sender
{
    RegisteViewController *regis = [[RegisteViewController alloc]init];
    
    [self.navigationController pushViewController:regis animated:YES];
}
//忘记密码
-(void)clickForgetBtn:(UIButton *)sender
{
    ForgetViewController *forget = [[ForgetViewController alloc]init];
    
    [self.navigationController pushViewController:forget animated:YES];
    
}


@end
