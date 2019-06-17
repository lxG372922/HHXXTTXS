//
//  COCMineViewController.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCMineViewController.h"
#import "MyTableViewCell.h"
#import "MyHeaderView.h"
#import "MyFooterView.h"
#import "ModifyNameViewController.h"
#import "SignatureViewController.h"
#import "ModifyPassViewController.h"
#import "LoginViewController.h"
@interface COCMineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleArr1, *titleArr2;
}
@property (nonatomic , strong)MyHeaderView *headerV;
@property (nonatomic , strong)MyFooterView *footerV;
@property (nonatomic , strong)UITableView *mytableView;
@property(nonatomic,assign) BOOL isLogin;


@end

@implementation COCMineViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    titleArr1 = @[@"交易明细",@"资金明细",@"银行卡",@"账户认证"];
    
    titleArr2 = @[@"昵称",@"个性签名",@"修改密码"];
  
    [self mytableView];
}

//懒加载表格
-(UITableView *)mytableView{
    if(!_mytableView){
        _mytableView = [[UITableView alloc]init];
        _mytableView.delegate = self;
        _mytableView.dataSource = self;
        _mytableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mytableView.bounces = NO;
        [self.view addSubview:_mytableView];
        
        [_mytableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).mas_offset(0);
            make.top.equalTo(self.view.mas_top).mas_offset(TOP_BAR_HEIGHT);
            make.right.equalTo(self.view.mas_right).mas_offset(0);
            make.bottom.equalTo(self.view.mas_bottom).mas_offset(-(BottomSafeArea + TAB_BAR_HRIGHT));
        }];
        
        _headerV = [[MyHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        
        self.mytableView.tableHeaderView = self.headerV;
        
        _footerV = [[MyFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
        _footerV.backgroundColor = RGB(251, 251, 251);
        [self.footerV.outBtn addTarget:self action:@selector(clickOutBtn:) forControlEvents:UIControlEventTouchUpInside];
        self.mytableView.tableFooterView = _footerV;
        
        
    }
    return _mytableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 4;
    }else{
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr = @"cellStr";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if(!cell){
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.section == 0){
        [cell refreashLayoutWithFrame:1];
        cell.titleLab.text = titleArr1[indexPath.row];
    }else{
        [cell refreashLayoutWithFrame:2];
        cell.titleLab.text = titleArr2[indexPath.row];
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *vv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    vv.backgroundColor = RGB(233, 233, 233);
    return vv;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        NSLog(@"0");
    }else{
        if(indexPath.row == 0){
            NSLog(@"1");
            ModifyNameViewController *modify = [[ModifyNameViewController alloc]init];
            modify.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:modify animated:YES];
        }else if(indexPath.row == 1){
            SignatureViewController *ignature = [[SignatureViewController alloc]init];
            ignature.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:ignature animated:YES];
            NSLog(@"2");
        }else if(indexPath.row == 2){
            ModifyPassViewController *modify = [[ModifyPassViewController alloc]init];
            modify.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:modify animated:YES];
            NSLog(@"3");
        }
    }
}
-(void)clickOutBtn:(UIButton *)sender{
    if([UserId isEqualToString:@""]){
//        [G_Window showMBHUDAlertWithMessage:@"请登录" hide:2.0];
        [SVProgressHUD showWithStatus:@"请登录"];
        [self performSelector:@selector(progressHUDdismiss) withObject:self afterDelay:1.5];
        LoginViewController *login = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }else{
        
        // 初始化对话框
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认退出吗？" preferredStyle:UIAlertControllerStyleAlert];
        // 确定注销
        _okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
            // 1.清除用户名、密码的存储
            [SVProgressHUD showWithStatus:@"退出成功"];
             [self performSelector:@selector(progressHUDdismiss) withObject:self afterDelay:1.5];
            LogOutRemoveUid;
            [self.mytableView reloadData];
            // 2.跳转到登录界面
            //            [self performSegueWithIdentifier:@"Logout" sender:nil];
        }];
        _cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:_okAction];
        [alert addAction:_cancelAction];
        
        // 弹出对话框
        [self presentViewController:alert animated:true completion:nil];
        
        
    }
    
}
-(void)progressHUDdismiss{
    [SVProgressHUD dismiss];
}


@end
