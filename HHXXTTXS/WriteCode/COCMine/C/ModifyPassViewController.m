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
 
    
    self.view.backgroundColor = RGB(245, 245, 245);
    self.textTF = [[UITextField alloc]initWithFrame:CGRectMake(0, 20 + TOP_BAR_HEIGHT, SCREEN_WIDTH, 50)];
    self.textTF.textAlignment = NSTextAlignmentCenter;
    self.textTF.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:self.textTF];
    
    
    self.textTF1 = [[UITextField alloc]initWithFrame:CGRectMake(0, 80 + TOP_BAR_HEIGHT, SCREEN_WIDTH, 50)];
    self.textTF1.textAlignment = NSTextAlignmentCenter;
    self.textTF1.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:self.textTF1];
    
    
    self.textTF1 = [[UITextField alloc]initWithFrame:CGRectMake(0, 140 + TOP_BAR_HEIGHT, SCREEN_WIDTH, 50)];
    self.textTF1.textAlignment = NSTextAlignmentCenter;
    self.textTF1.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:self.textTF1];
    
    
    self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(25, TOP_BAR_HEIGHT + 240, SCREEN_WIDTH - 50, 45)];
    [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    self.saveBtn.layer.cornerRadius = 5;
    self.saveBtn.layer.masksToBounds = YES;
    self.saveBtn.backgroundColor = RGB(51, 51, 51);
    [self.saveBtn addTarget:self action:@selector(clickSaveBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveBtn];
}

-(void)clickSaveBtn:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


@end
