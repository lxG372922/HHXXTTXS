//
//  SignatureViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "SignatureViewController.h"
#import "UITextView+PlaceHolder.h"
@interface SignatureViewController ()

@property (nonatomic , strong)UITextView *textV;

@property (nonatomic , strong)UIButton *saveBtn;


@end

@implementation SignatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个性签名";
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 20 + TOP_BAR_HEIGHT, SCREEN_WIDTH, 20)];
    lab.text = @"请输入个性签名";
    lab.textColor = RGB(151, 151, 151);
    [self.view addSubview:lab];
    
    self.view.backgroundColor = RGB(245, 245, 245);
    self.textV = [[UITextView alloc]initWithFrame:CGRectMake(0, 45 + TOP_BAR_HEIGHT, SCREEN_WIDTH, 150)];
    self.textV.backgroundColor = RGB(255, 255, 255);
    [self.view addSubview:self.textV];
    
    self.saveBtn = [[UIButton alloc]initWithFrame:CGRectMake(25, TOP_BAR_HEIGHT + 220, SCREEN_WIDTH - 50, 45)];
    [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    self.saveBtn.layer.cornerRadius = 5;
    self.saveBtn.layer.masksToBounds = YES;
    self.saveBtn.backgroundColor = RGB(51, 51, 51);
    [self.saveBtn addTarget:self action:@selector(clickSaveBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.saveBtn];
}


-(void)clickSaveBtn:(UIButton *)sender{
    LoginAndSaveQM(self.textV.text)
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
