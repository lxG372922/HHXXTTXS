//
//  COCSetCCViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCSetCCViewController.h"

@interface COCSetCCViewController ()<UITextFieldDelegate>

@end

@implementation COCSetCCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"编辑持仓";
    self.setZhiYTF.delegate = self;
    self.setZhiSTF.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)queDingBtnClick:(id)sender{
    
    [self.setZhiYTF resignFirstResponder];
    if (self.setZhiSTF.text == nil && self.setZhiYTF.text == nil) {
        [PKProgressHUD pkShowErrorWithStatueTitle:@"请输入止盈或者止损值"];
        return;
    }
    
    [SVProgressHUD show];
    [self performSelector:@selector(progressHUDdismiss) withObject:self afterDelay:1.5];
    
}

-(void)progressHUDdismiss{
    [PKProgressHUD pkShowErrorWithStatueTitle:@"设置成功！"];
    [SVProgressHUD dismiss];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField == self.setZhiYTF) {
        NSString *string =   [NSString stringWithFormat:@"止盈+%@",self.setZhiYTF.text];
        self.zhiYLabel.text = string ;
    }else{
         self.zhiSLabel.text =[NSString stringWithFormat:@"止损-%@",self.setZhiSTF.text] ;
    }
   
   
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
