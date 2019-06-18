//
//  COCPositionViewController.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCPositionViewController.h"
#import "GLPositionModel.h"
@interface COCPositionViewController ()<UITableViewDelegate,UITableViewDataSource,ContractManagerDelegate>{
    NSDictionary *dic ;
}
@property (nonatomic , strong)UITableView *holdPos_tableView;
@property (nonatomic,strong) UIImageView *noDataImageView;
@property (nonatomic,strong)UIButton *makeOrderBtn;
@property (nonatomic,strong) PostHeaderView *headerView;
@property (nonatomic,strong) COCHostModel *model;
@property (nonatomic,strong) UIView *tableHearderView;
@property (nonatomic,strong) UIView *noDataView;
@property (nonatomic , strong)NSMutableArray *holdPosArray;
@property (nonatomic,strong) GLPositionModel *postionModel;

@end
static NSString *const communitypostionCell_id= @"communitypostionCell_id";
@implementation COCPositionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [[ContractManager manager] addDelegate:self];
    self.postionModel = [[GLPositionModel alloc]init];
    //历史记录
    [self creatRightBarButton];
    [self configUI];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!isReachability) {
        [PKProgressHUD pkShowErrorWithStatueTitle:@"无网络，请稍后重试!"];
        [self.holdPos_tableView.mj_header endRefreshing];
        return;
    }
//    self.tabBarController.tabBar.hidden = NO;
   
    [SVProgressHUD show];
    [self performSelector:@selector(progressHUDdismiss) withObject:self afterDelay:1.5];
}


-(void)progressHUDdismiss{
    //l可用资金
  dic  =  [[ContractManager manager] positions];
    NSArray *dataSource = [dic allValues];
    self.holdPosArray = [dataSource mutableCopy];

    if (self.holdPosArray.count > 0) {
        self.postionModel = dic[dic.allKeys[0]];
        self.holdPos_tableView.alpha = 1;
        self.noDataView.alpha = 0;
    }else{
        self.holdPos_tableView.alpha = 0;
        self.noDataView.alpha = 1;
    }
  
    
    
    self.headerView.bondjinE.text = [[ContractManager manager] getAllOCCMargin];
    self.headerView.totaijinE.text = [[ContractManager manager] getAllPL];
    self.headerView.netCapjinE.text = [[ContractManager manager] getCurrentAllCapital];
    
    
    [self.holdPos_tableView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
    [self.holdPos_tableView reloadData];
}

-(void)configUI{
    self.headerView  = [[PostHeaderView alloc]initWithDataModel:self.model oiginY:Nav_topH];
//    self.headerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.headerView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.holdPos_tableView];
    
    [self.holdPos_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).mas_offset(0);
        make.top.equalTo(self.headerView.mas_bottom).mas_offset(0);
        make.right.equalTo(self.view.mas_right).mas_offset(0);
        make.bottom.equalTo(self.view.mas_bottom).mas_offset(0);
    }];
    [self.view addSubview:self.noDataView];
 
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
    hostVc.hidesBottomBarWhenPushed = YES;
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
        [makeOrderBtn setBackgroundColor:BTNCOlor];
        [makeOrderBtn addTarget:self action:@selector(makeOrderClick) forControlEvents:UIControlEventTouchUpInside];
        makeOrderBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [makeOrderBtn setTitleColor:COCColorBackGround forState:UIControlStateNormal];
        [_noDataView addSubview:makeOrderBtn];
        
    }
    return _noDataView;
}
-(NSMutableArray *)holdPosArray{
    if (!_holdPosArray) {
        _holdPosArray = [NSMutableArray array];
    }
    return _holdPosArray;
}

-(UITableView *)holdPos_tableView{
    if(!_holdPos_tableView){
        _holdPos_tableView = [[UITableView alloc]init];
        _holdPos_tableView.delegate = self;
        _holdPos_tableView.dataSource = self;
        _holdPos_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _holdPos_tableView.backgroundColor = RGBColor(247, 247, 247);
        [_holdPos_tableView registerNib:[UINib nibWithNibName:@"COCPosTableViewCell" bundle:nil] forCellReuseIdentifier:communitypostionCell_id];
        
//        self.holdPos_tableView.tableHeaderView = self.tableHearderView;
        _holdPos_tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [SVProgressHUD show];
            [self performSelector:@selector(progressHUDdismiss) withObject:self afterDelay:1.5];
            
        }];
        
        _holdPos_tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            
            [SVProgressHUD show];
            
        }];
    }
    return _holdPos_tableView;
}

-(UIView *)tableHearderView{
    if (!_tableHearderView) {
        _tableHearderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCALE_Length(50))];
        _tableHearderView.backgroundColor =RGBColor(247, 247, 247);
        UILabel *rnLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 120, 20)];
        rnLabel.text =@"日内持仓";
        rnLabel.font = FONT(12);
        rnLabel.textColor = RGBColor(55, 13, 74);
        [_tableHearderView addSubview:rnLabel];
        
        UIButton *yjpcBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        yjpcBtn.frame = CGRectMake(SCREEN_Width -SCALE_Length(120.f) - 20 ,10, SCALE_Length(120.f), SCALE_Length(30.f));
        [yjpcBtn setTitle:@"一键平仓" forState:UIControlStateNormal];
        [yjpcBtn setBackgroundColor:RGBColor(20,44, 51)];
        yjpcBtn.layer.cornerRadius = 5;
        [yjpcBtn addTarget:self action:@selector(showAllClick) forControlEvents:UIControlEventTouchUpInside];
        yjpcBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [yjpcBtn setTitleColor:COCColorBackGround forState:UIControlStateNormal];
        [_tableHearderView addSubview:yjpcBtn];
    }
    return _tableHearderView;
}

#pragma ---------------按钮点击事件

-(void)makeOrderClick{
    if(Has_Login){
         self.tabBarController.selectedIndex = 1;
    }else{
        [PKProgressHUD pkShowErrorWithStatueTitle:@"未登录，请先登录！"];
    }
   
}
-(void)showAllClick{
    if (!isReachability) {
        [PKProgressHUD pkShowErrorWithStatueTitle:@"无网络，请稍后重试!"];
        [self.holdPos_tableView.mj_header endRefreshing];
        return;
    }
//    COCTransViewController *transVC = [[COCTransViewController alloc]init];
//    transVC.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:transVC animated:YES];
}

#pragma -------------------ContractManagerDelegate -------------

- (void)contractManager:(ContractManager *)manager positionListDidChange:(NSDictionary<NSString *,GLPositionModel *> *)positionList {
    
    [self progressHUDdismiss];
    
}


#pragma ------------------tableviewDelegate---------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dic.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    COCPosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:communitypostionCell_id];
    if(!cell){
        cell = [[COCPosTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:communitypostionCell_id];
        
    }
    cell.setZYZSblock = ^{
        COCSetCCViewController *setVC = [[COCSetCCViewController alloc]init];
        setVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:setVC animated:YES];
    };
    cell.Marketblock = ^{
        
    };
    cell.pingCblock = ^(NSNumber * _Nonnull index) {
        OrderModel * mode = [OrderModel new];
        mode.identifier = self.postionModel.identifier;
        NSString * show;
        if ((self.postionModel.positionType = ContractTradeTypeOpenLong)  ) {
            mode.tradeType = ContractTradeTypeCloseLong;
        }else{
            show = @"卖空";
            mode.tradeType = ContractTradeTypeOpenShort;
        }
        
        [[ContractManager manager]addOrderWithModel:mode];
        
        [SVProgressHUD show];
        [self performSelector:@selector(progressHUDdismiss) withObject:self afterDelay:1.5];
    };
    cell.backgroundColor = UIColor.clearColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    [cell setPositionTableViewCellControlContentWithModel:dic[dic.allKeys[0]]];
    GLPositionModel *glPosition = [self.holdPosArray objectAtIndex:indexPath.row];
    [cell setPositionTableViewCellControlContentWithModel:glPosition];
    
//
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    NSDictionary *dic = self.holdPosArray[indexPath.row];
    //    NSString *title = [dic objectForKey:@"title"];
    //    CGSize titleSize  =[title boundingRectWithSize:CGSizeMake(SCREEN_Width - 30.00, CGFLOAT_MAX) fontSize:16];
    return 130;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSDictionary *dic = self.holdPosArray[indexPath.row];
    COCPositionDetailViewController *hisVc = [[COCPositionDetailViewController alloc]init];
    hisVc.hidesBottomBarWhenPushed = YES;
    [hisVc updatelabelDataWith:self.postionModel];
    [self.navigationController pushViewController:hisVc animated:YES];
}

@end
