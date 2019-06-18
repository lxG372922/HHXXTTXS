//
//  ModifyPassViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ModifyPassViewController.h"

@interface ModifyPassViewController ()

@property (nonatomic , strong)UITextField *textTF;

@property (nonatomic , strong)UITextField *textTF1;

@property (nonatomic , strong)UITextField *textTF2;

@property (nonatomic , strong)UIButton *saveBtn;


@end

@implementation ModifyPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = @"修改密码";
    
    self.view.backgroundColor = RGB(245, 245, 245);
    self.textTF = [[UITextField alloc]initWithFrame:CGRectMake(0, 20 + TOP_BAR_HEIGHT, SCREEN_WIDTH, 50)];
    self.textTF.textAlignment = NSTextAlignmentCenter;
    self.textTF.placeholder = @"请输入旧密码";
    self.textTF.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:self.textTF];
    
    
    self.textTF1 = [[UITextField alloc]initWithFrame:CGRectMake(0, 80 + TOP_BAR_HEIGHT, SCREEN_WIDTH, 50)];
    self.textTF1.textAlignment = NSTextAlignmentCenter;
    self.textTF1.placeholder = @"请输入新密码";
    self.textTF1.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:self.textTF1];
    
    
    self.textTF2 = [[UITextField alloc]initWithFrame:CGRectMake(0, 140 + TOP_BAR_HEIGHT, SCREEN_WIDTH, 50)];
    self.textTF2.textAlignment = NSTextAlignmentCenter;
    self.textTF2.backgroundColor = RGB(255, 255, 255);
    self.textTF2.placeholder = @"请输入新密码";
    [self.view addSubview:self.textTF2];
    
    
    self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(25, TOP_BAR_HEIGHT + 240, SCREEN_WIDTH - 50, 45)];
    [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    self.saveBtn.layer.cornerRadius = 5;
    self.saveBtn.layer.masksToBounds = YES;
    self.saveBtn.backgroundColor = RGB(51, 51, 51);
    [self.saveBtn addTarget:self action:@selector(clickSaveBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveBtn];
}

-(void)clickSaveBtn:(UIButton *)sender{
    
    if([self.textTF.text isEqualToString:UserMiMa]){
        NSLog(@"1");
        if([self.textTF1.text isEqualToString:self.textTF2.text]){
            LoginAndSaveMiMa(self.textTF2.text)
            LogOutRemoveUid;
            [self.navigationController popViewControllerAnimated:YES];
            [G_Window showMBHUDAlertWithMessage:@"账号或密码错误 已退出当前账号" hide:1.5];
        }
    }
    
    
    
}


@end
