//
//  COCPositionViewController.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCPositionViewController.h"

@interface COCPositionViewController ()
@property (nonatomic,strong) UIImageView *noDataImageView;
@property (nonatomic,strong)UIButton *makeOrderBtn;
@property (nonatomic,strong) PostHeaderView *headerView;
@property (nonatomic,strong) PositionModel *model;
@property (nonatomic,strong) UIView *noDataView;


@end

@implementation COCPositionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    //历史记录
    [self creatRightBarButton];
    //headerView
    [self addheaderView];
    
    [self.view addSubview:self.noDataView];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [SVProgressHUD show];
    [self performSelector:@selector(progressHUDdismiss) withObject:self afterDelay:1.5];
}


-(void)progressHUDdismiss{
    [SVProgressHUD dismiss];
}

-(void)addheaderView{
    self.headerView  = [[PostHeaderView alloc]initWithDataModel:self.model oiginY:Nav_topH];
//    self.headerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.headerView];
}
-(void)creatRightBarButton{
    UIButton *hostBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [hostBtn setTitle:@"历史记录" forState:UIControlStateNormal];
    [hostBtn addTarget:self action:@selector(addtailkClick) forControlEvents:UIControlEventTouchUpInside];
    hostBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [hostBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:hostBtn];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

#pragma ---------------------------------------------
#pragma  ------按钮点击事件-----------
-(void)addtailkClick{
    COCPositionHostViewController *hostVc  = [[COCPositionHostViewController alloc]init];
    hostVc.title = @"历史订单";
    [self.navigationController pushViewController:hostVc animated:YES];
}


#pragma -------lazy----------------

-(UIView *)noDataView{
    if (!_noDataView) {
        _noDataView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_Width - SCALE_Length(80.f))/2, (SCREEN_Height - SCALE_Length(120.f))/2, SCALE_Length(80.f), SCALE_Length(120.f))];
        _noDataView.backgroundColor = [UIColor clearColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fanchuan"]];
        imageView.frame = CGRectMake(0, 0, SCALE_Length(80), SCALE_Length(80));
        [_noDataView addSubview:imageView];
        UIButton *makeOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        makeOrderBtn.frame = CGRectMake(0, CGRectGetMaxY(imageView.frame) + 10, SCALE_Length(80.f), SCALE_Length(28.f));
        [makeOrderBtn setTitle:@"马上下单" forState:UIControlStateNormal];
        [makeOrderBtn setBackgroundColor:RGBColor(20,44, 51)];
        [makeOrderBtn addTarget:self action:@selector(makeOrderClick) forControlEvents:UIControlEventTouchUpInside];
        makeOrderBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [makeOrderBtn setTitleColor:COCColorBackGround forState:UIControlStateNormal];
        [_noDataView addSubview:makeOrderBtn];
        
    }
    return _noDataView;
}

-(void)makeOrderClick{
    self.tabBarController.selectedIndex = 1;
}

@end
