//
//  BankCardView.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//


//返回银行缩写
//https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=银行卡卡号&cardBinCheck=true

#import "BankCardView.h"

@implementation BankCardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self getBankName];
    }
    return self;
}

-(void)getBankName{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"bank.json" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    bankNameDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    contenArr = bankNameDic.allValues;
    
    [self coufUI];
}

-(void)coufUI{
    
    NSString *name = userGet(@"USERNAME");
    
    titleL = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width*0.05, Nav_topH, SCREEN_Width*0.9, SCREEN_Width*0.15)];
    titleL.numberOfLines = 0;
    titleL.textColor = RGBColor(60, 60, 60);
    titleL.font = NameFont(14);
    titleL.text = [NSString stringWithFormat:@"请填入您个人的银行卡信息\n请填入与  %@  信息一致的银行卡卡号",name];
    [self addSubview:titleL];
    
    
    nameDropDownMenu = [[XDSDropDownMenu alloc] init];
    nameDropDownMenu.tag = 1000;
    
    cardBack = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleL.frame)+SCREEN_Width*0.1, SCREEN_Width, SCREEN_Width*0.12)];
    cardBack.backgroundColor = [UIColor whiteColor];
    LXViewShadow(cardBack, RGBColor(200, 200, 200), CGSizeMake(3, 3), 0.5, 1.5);
    [self addSubview:cardBack];
    
    [cardBack addSubview:self.cardT];
    
    
    nameBack = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(cardBack.frame)+SCREEN_Width*0.1, SCREEN_Width, SCREEN_Width*0.12)];
    nameBack.backgroundColor = [UIColor whiteColor];
    LXViewShadow(nameBack, RGBColor(200, 200, 200), CGSizeMake(3, 3), 0.5, 1.5);
    [self addSubview:nameBack];
    
    [nameBack addSubview:self.bankBack];
    
    [self addSubview:self.lastBtn];
    
}


#pragma mark - 展示控件

- (UITextField *)cardT{
    if (!_cardT) {
        _cardT = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_Width*0.05, 0, SCREEN_Width*0.9, SCREEN_Width*0.12)];
        //字体
        _cardT.font = NameFont(15);
        _cardT.clearButtonMode = UITextFieldViewModeWhileEditing;
        //字体颜色
        _cardT.textColor = RGBColor(60, 60, 60);
        //无边框设置
        _cardT.borderStyle = UITextBorderStyleNone;
        
        _cardT.placeholder = @"请输入正确的银行卡号";
        
        _cardT.delegate = self;
    }
    return _cardT;
}
//当编辑结束，文本字段会让出第一响应者
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    if (textField.text.length == 0) {
        return YES;
    }
    
    WS(weakSelf);
    
    [SVProgressHUD showWithStatus:@"正在查询"];
    
    ASOHTTPRequest *request = [[ASOHTTPRequest alloc]init];
    
//    6228480402564890018
    
    
    [request oneGet:[NSString stringWithFormat:@"https://ccdcapi.alipay.com/validateAndCacheCardInfo.json?_input_charset=utf-8&cardNo=%@&cardBinCheck=true",textField.text] path:[NSString string] parameters:[NSDictionary dictionary] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [SVProgressHUD dismiss];
        
        NSDictionary *dic = (NSDictionary *)responseObject;
        
        NSString *isSuccess = [NSString stringWithFormat:@"%@",dic[@"validated"]];
        
        NSLog(@"%@",isSuccess);
        
        if (![isSuccess isEqualToString:@"0"]) {
            
            NSString *bankKey = dic[@"bank"];
            
            weakSelf.bankClass = self->bankNameDic[bankKey];
            
            if (weakSelf.bankClass.length == 0) {
                
                [SVProgressHUD showErrorWithStatus:@"暂不支持使用该银行账户"];
                
                return;
            }
            
            [weakSelf.bankBack setTitle:weakSelf.bankClass forState:UIControlStateNormal];
            
        }else{
            [SVProgressHUD showErrorWithStatus:@"请输入正确的银行卡号"];
        }
        
        
    } faile:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:@"网络延迟"];
        
    }];
    
    return YES;
}


- (UIButton *)bankBack{
    if (!_bankBack) {
        _bankBack = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width*0.05, 0, SCREEN_Width*0.9, SCREEN_Width*0.12)];
        _bankBack.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _bankBack.titleLabel.font = NameFont(15);
        [_bankBack setTitle:@"选择银行" forState:UIControlStateNormal];
        [_bankBack setTitleColor:RGBColor(60, 60, 60) forState:UIControlStateNormal];
        [_bankBack addTarget:self action:@selector(selectBankName:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bankBack;
}

-(void)selectBankName:(UIButton *)sender{
    
    nameDropDownMenu.delegate = self;//设置代理
    
    //调用方法判断是显示下拉菜单，还是隐藏下拉菜单
    [self setupDropDownMenu:nameDropDownMenu withTitleArray:contenArr andButton:sender andDirection:@"down"];
    
}


#pragma mark - 设置dropDownMenu

/*
 判断是显示dropDownMenu还是收回dropDownMenu
 */

- (void)setupDropDownMenu:(XDSDropDownMenu *)dropDownMenu withTitleArray:(NSArray *)titleArray andButton:(UIButton *)button andDirection:(NSString *)direction{
    
    CGRect btnFrame = CGRectMake(SCREEN_Width*0.05, CGRectGetMaxY(cardBack.frame)+SCREEN_Width*0.1, SCREEN_Width*0.9, SCREEN_Width*0.12); //如果按钮在UIIiew上用这个
    
    //  CGRect btnFrame = [self getBtnFrame:button];//如果按钮在UITabelView上用这个
    
    
    if(dropDownMenu.tag == 1000){
        
        /*
         如果dropDownMenu的tag值为1000，表示dropDownMenu没有打开，则打开dropDownMenu
         */
        
        //初始化选择菜单
        [dropDownMenu showDropDownMenu:button withButtonFrame:btnFrame arrayOfTitle:titleArray arrayOfImage:nil animationDirection:direction];
        
        //添加到主视图上
        [self addSubview:dropDownMenu];
        
        //将dropDownMenu的tag值设为2000，表示已经打开了dropDownMenu
        dropDownMenu.tag = 2000;
        
    }else {
        /*
         如果dropDownMenu的tag值为2000，表示dropDownMenu已经打开，则隐藏dropDownMenu
         */
        
        [dropDownMenu hideDropDownMenuWithBtnFrame:btnFrame];
        dropDownMenu.tag = 1000;
    }
}

#pragma mark - 下拉菜单代理
/*
 在点击下拉菜单后，将其tag值重新设为1000
 */
- (void) setDropDownDelegate:(XDSDropDownMenu *)sender{
    sender.tag = 1000;
    
}

#pragma mark - 下一步按钮
- (UIButton *)lastBtn{
    if (!_lastBtn) {
        
        _lastBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width*0.08, CGRectGetMaxY(nameBack.frame)+SCREEN_Width*0.2, SCREEN_Width*0.84, SCREEN_Width*0.1)];
        LXViewRadius(_lastBtn, 5);
        _lastBtn.backgroundColor = RGBColor(50, 50, 50);
        [_lastBtn setTitle:@"申请开户" forState:UIControlStateNormal];
        
    }
    return _lastBtn;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}

@end
