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
#import "COCOpenViewController.h"
#import "ContractManager.h"
#import <StoreKit/StoreKit.h>

@interface COCMineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *titleArr1, *titleArr2;
    NSArray *titleArrM1 , *titleArrM2;
}
@property (nonatomic , strong)MyHeaderView *headerV;
@property (nonatomic , strong)MyFooterView *footerV;
@property (nonatomic , strong)UITableView *mytableView;
@property(nonatomic,assign) BOOL isLogin;


@end

@implementation COCMineViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.mytableView reloadData];
    [self headerViewWithData];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    titleArr1 = @[@"交易明细",@"资金明细",@"银行卡",@"账户认证"];
    titleArrM1 = @[@"icon_1",@"icon_2",@"icon_3",@"icon_4"];
    
    titleArr2 = @[@"昵称",@"个性签名",@"修改密码",@"重置模拟资金",@"去评分"];
    
    titleArrM2 = @[@"icon_5",@"形状",@"icon_7",@"chongzhi",@"icon_comment"];
    
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
        _mytableView.showsVerticalScrollIndicator = NO;
        _mytableView.showsHorizontalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            _mytableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        [self.view addSubview:_mytableView];
        
        [_mytableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_left).mas_offset(0);
            make.top.equalTo(self.view.mas_top).mas_offset(0);
            make.right.equalTo(self.view.mas_right).mas_offset(0);
            make.bottom.equalTo(self.view.mas_bottom).mas_offset(-(BottomSafeArea + TAB_BAR_HRIGHT));
        }];
        
        _headerV = [[MyHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200 + NavMustAdd)];
        [self headerViewWithData];
        //实名认证按钮
        [self.headerV.certificationBtn addTarget:self action:@selector(clickCertificationBtn:) forControlEvents:UIControlEventTouchUpInside];
        if(Has_Login){
            
        }else{
            
        }
        
        self.mytableView.tableHeaderView = self.headerV;
        
        _footerV = [[MyFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
        _footerV.backgroundColor = RGB(251, 251, 251);
        [self.footerV.outBtn addTarget:self action:@selector(clickOutBtn:) forControlEvents:UIControlEventTouchUpInside];
        self.mytableView.tableFooterView = _footerV;
        
        
    }
    return _mytableView;
}

-(void)tapGRActionChangeHeaderImg{
    [G_Window showMBHUDAlertWithMessage:@"请登录" hide:2.0];
    
    LoginViewController *login = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}
-(void)clickCertificationBtn:(UIButton *)sender{
    
    if(Has_Login){
        COCOpenViewController * cocopen = [[COCOpenViewController alloc]init];
        cocopen.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:cocopen animated:YES];
    }else{
        [G_Window showMBHUDAlertWithMessage:@"请登录" hide:1.5];
    }
    
    NSLog(@"实名认证");
}
-(void)headerViewWithData{
    if(Has_Login){
        _headerV.nameLab.userInteractionEnabled = NO;
        self.headerV.signatureLab.hidden = NO;
        [self.footerV.outBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        if(Has_Name){
            _headerV.nameLab.text = UserName;
        }else{
            _headerV.nameLab.text = @"天下无双";
        }
        if(Has_QM){
            _headerV.signatureLab.text = UserQM;
        }else{
            _headerV.signatureLab.text = @"个性签名";
        }
        
    }else{
        [self.footerV.outBtn setTitle:@"去登录" forState:UIControlStateNormal];
        self.headerV.signatureLab.hidden = YES;
        UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGRActionChangeHeaderImg)];
        //为View标签添加手势
        self.headerV.nameLab.userInteractionEnabled=YES;
        [self.headerV.nameLab addGestureRecognizer:gesture];
        _headerV.nameLab.text = @"去登录";
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 4;
    }else{
        return titleArr2.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr = @"cellStr";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if(!cell){
        cell = [[MyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.section == 0){
        [cell refreashLayoutWithFrame:1];
        cell.titleLab.text = titleArr1[indexPath.row];
        cell.imgV.image = [UIImage imageNamed:titleArrM1[indexPath.row]];
    }else{
        [cell refreashLayoutWithFrame:2];
        cell.titleLab.text = titleArr2[indexPath.row];
        if(Has_Name){
            if(indexPath.row == 0){
                cell.detailsLab.text = UserName;
            }else if(indexPath.row == 1){
                
            }else{
                
            }
            
        }else{
            if(indexPath.row == 0){
                cell.detailsLab.text = @"天下无双";
            }else if(indexPath.row == 1){
                
            }else{
                
            }
            
        }
        if(Has_QM && Has_Login){
            if(indexPath.row == 0){
                
            }else if(indexPath.row == 1){
                cell.detailsLab.text = UserQM;
            }else{
                
            }
            
        }else{
            if(indexPath.row == 0){
                
            }else if(indexPath.row == 1){
                cell.detailsLab.text = @"个性签名";
            }else{
                
            }
        }
        cell.imgV.image = [UIImage imageNamed:titleArrM2[indexPath.row]];
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
        if(Has_Login){
            COCOpenViewController * cocopen = [[COCOpenViewController alloc]init];
            cocopen.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:cocopen animated:YES];
        }else{
            [G_Window showMBHUDAlertWithMessage:@"请登录" hide:1.5];
        }
        
        
    }else{
        
        if (indexPath.row <= 3) {
            if(Has_Login){
                
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
                }else if(indexPath.row == 3){
                    [[ContractManager manager] resetSimulateCapitail];
                    [G_Window showMBHUDAlertWithMessage:@"重置成功" hide:1.5];
                }
            }else {
                [G_Window showMBHUDAlertWithMessage:@"请登录" hide:1.5];
            }
        }else {
            if (indexPath.row == 4) {
                if (@available(iOS 10.3, *)) {
                    [SKStoreReviewController requestReview];
                }
            }
        }
    }
}
-(void)clickOutBtn:(UIButton *)sender{
    if([UserId isEqualToString:@""]){
        [G_Window showMBHUDAlertWithMessage:@"请登录" hide:2.0];
        
        LoginViewController *login = [[LoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }else{
        
        // 初始化对话框
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"确认退出吗？" preferredStyle:UIAlertControllerStyleAlert];
        // 确定注销
        _okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action) {
            // 1.清除用户名、密码的存储
            LogOutRemoveUid;
            
            [self viewWillAppear:1];
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



@end
