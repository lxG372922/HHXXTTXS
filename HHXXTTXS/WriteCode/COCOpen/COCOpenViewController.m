//
//  COCOpenViewController.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCOpenViewController.h"

#import "OpenString.h"

#import "IdentityView.h"
#import "FillView.h"
#import "BankCardView.h"
#import "CarryView.h"

@interface COCOpenViewController ()

@property(nonatomic,strong)IdentityView *idenV;
@property(nonatomic,strong)FillView *fillV;
@property(nonatomic,strong)BankCardView *bankV;
@property(nonatomic,strong)CarryView *carrV;

@end

@implementation COCOpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"实盘开户";
    
    NSString *isSubmit = userGet(@"isSubmit");
    
    if ([isSubmit isEqualToString:@"YES"]) {
        
        [self.view addSubview:self.carrV];
        self.carrV.alpha = 1;
        
    }else{
        [self.view addSubview:self.carrV];
        [self.view addSubview:self.bankV];
        [self.view addSubview:self.fillV];
        [self.view addSubview:self.idenV];
    }
    
}

#pragma mark - 第一页
- (IdentityView *)idenV{
    if (!_idenV) {
        _idenV = [[IdentityView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height)];
        _idenV.backgroundColor = RGBColor(250, 250, 250);
        [_idenV.nextView addTarget:self action:@selector(pusNextView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _idenV;
}

-(void)pusNextView{
    
    if (!_idenV.selectR) {
        [SVProgressHUD showErrorWithStatus:@"请您上传身份证原件正面图片"];
        return;
    }
    
    if (!_idenV.selectE) {
        [SVProgressHUD showErrorWithStatus:@"请您上传身份证原件反面图片"];
        return;
    }
    
//    进入下一页
    
    WS(weakSelf);
    
    [UIView animateWithDuration:0.5 animations:^{
        
        weakSelf.idenV.alpha = 0;
        weakSelf.fillV.alpha = 1;
        
    }];
    
}

#pragma mark - 第二页
- (FillView *)fillV{
    if (!_fillV) {
        _fillV = [[FillView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height)];
        _fillV.backgroundColor = RGBColor(250, 250, 250);
        [_fillV.nextBtn addTarget:self action:@selector(nextViewPush) forControlEvents:UIControlEventTouchUpInside];
        _fillV.alpha = 0.0;
    }
    return _fillV;
}

-(void)nextViewPush{
    WS(weakSelf);
    
    if (_fillV.nameT.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入您的姓名"];
        return;
    }
    
    if (_fillV.numberT.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入您的身份证号码"];
        return;
    }
    
    [SVProgressHUD showWithStatus:@"校验中"];
    _fillV.nextBtn.userInteractionEnabled = NO;

    ASOHTTPRequest *request = [[ASOHTTPRequest alloc]init];

    [request oneGet:[NSString stringWithFormat:@"http://apis.juhe.cn/idcard/index?cardno=%@&key=%@",_fillV.numberT.text,juheKey] path:[NSString string] parameters:[NSDictionary dictionary] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];

        NSDictionary *dic = (NSDictionary *)responseObject;

        NSString *checkStr = dic[@"resultcode"];

        NSString *alertStr = dic[@"reason"];

        if ([checkStr isEqualToString:@"200"]) {
            [SVProgressHUD showSuccessWithStatus:@"校验成功"];
            
            userSave(weakSelf.fillV.nameT.text, @"USERNAME");
            
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.fillV.alpha = 0;
                weakSelf.bankV.alpha = 1;
                
                [weakSelf.bankV getNameTest];
                
            }];

        }else{
            [SVProgressHUD showErrorWithStatus:alertStr];
        }

        weakSelf.fillV.nextBtn.userInteractionEnabled = YES;


    } faile:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"网络延迟"];
        weakSelf.fillV.nextBtn.userInteractionEnabled = YES;

    }];
    
    
}

#pragma mark - 第三页

- (BankCardView *)bankV{
    if (!_bankV) {
        _bankV = [[BankCardView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height)];
        _bankV.backgroundColor = RGBColor(250, 250, 250);
        _bankV.alpha = 0.0;
        [_bankV.lastBtn addTarget:self action:@selector(ApplyForAnAccount) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bankV;
}

-(void)ApplyForAnAccount{
    
    if ([_bankV.bankClass isEqualToString:_bankV.bankBack.titleLabel.text]) {
        
        userSave(@"YES", @"isSubmit");
        
        WS(weakSelf);
        [UIView animateWithDuration:0.5 animations:^{
            
            weakSelf.bankV.alpha = 0;
            weakSelf.carrV.alpha = 1;
            
        }];
        
    }else{
        
        [SVProgressHUD showErrorWithStatus:@"账户与银行不符\n请重新选择"];
        
    }
    
}

#pragma mark - 第四页

- (CarryView *)carrV{
    
    if (!_carrV) {
        _carrV = [[CarryView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height)];
        _carrV.backgroundColor = RGBColor(250, 250, 250);
        _carrV.alpha = 0.0;
    }
    return _carrV;
}

@end
