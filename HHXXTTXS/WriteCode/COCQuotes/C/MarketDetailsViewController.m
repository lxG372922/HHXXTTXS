//
//  MarketDetailsViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MarketDetailsViewController.h"
#import "BottomView.h"
#import "detailsTopView.h"
#import "HSStockChartView.h"
#import "HSStockChartModelGroup.h"
#import "HSStockChartModel.h"
#import "COCTransViewController.h"
#import "ContractManager.h"
@interface MarketDetailsViewController ()<HSStockChartViewDelegate>
@property(nonatomic,strong)detailsTopView * topView;
@property(nonatomic,strong) BottomView * bottomView ;
@property(nonatomic,strong) HSStockChartView * chartView ;
@property(nonatomic,strong) UISegmentedControl * clickTimeSegement ;

@property(nonatomic,copy) NSArray * dataArray;
@end

@implementation MarketDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBColor(29, 36, 51);
    self.title = _marketName;
    
    [self creatDetailUI];
    
}

-(void)creatDetailUI{
    //头
    _topView = [[detailsTopView alloc] initWithFrame:Nav_topH model:_marketmodel];
    [self.view addSubview:_topView];
    
    
    NSString * str ;
    if (Has_Login) {
        str = [[ContractManager manager] getCurrentAvailCaptital];
    }else{
        str = @"---";
    }
    //尾
    weakSelf(self);
    _bottomView =[[BottomView alloc] initWithPrince:_marketmodel.current maneyALl:str buyAction:^{
        
        [weakSelf clickType:1];
        
    } clickCenBtn:^{
         [weakSelf clickType:2];
    } sellAction:^{
         [weakSelf clickType:3];
    }];
    
    [self.view addSubview:_bottomView];
    
//    //sege
    _clickTimeSegement = [[UISegmentedControl alloc] initWithItems:@[@"1分",@"3分",@"5分",@"15分",@"60分"]];
    _clickTimeSegement.frame =CGRectMake(20, _topView.height+Nav_topH, SCREEN_WIDTH-40, 30);
    _clickTimeSegement.tintColor = COCColorLong;//[UIColor lightGrayColor];
     [_clickTimeSegement addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventValueChanged];
    _clickTimeSegement.selectedSegmentIndex = 0;
    [self.view addSubview:_clickTimeSegement];
   
    //line
    _chartView = [[HSStockChartView alloc] initWithFrame:CGRectMake(0, _topView.height+Nav_topH+_clickTimeSegement.height+3, SCREEN_WIDTH, SCREEN_HEIGHT-Nav_topH-_topView.height-_bottomView.height-_clickTimeSegement.height)];
    _chartView.delegate = self;
    [self.view addSubview:_chartView];
    
   
    [self getModelArray:0];
    
}
-(void)clickType:(int)type{
    
    
    
    if(!Has_Login){
        
        [SVProgressHUD showErrorWithStatus:@"请登录"];
        return;
        
    }
    /*
     *
     ** KongOrDuo 买空或买多
     ** price 价格
     ** BaoZJin 保证金
     ** shouxuFei 手续费
     ** isSelectedJY  是否点击交易
     */
    
    NSDictionary * dict;
    if(type == 1){
        dict = @{@"KongOrDuo":@"Duo",@"price":_marketmodel.current,@"BaoZJin":@"898798",@"shouxuFei":@"12.434",@"isSelectedJY":@"0"};
    }else if(type == 2){
          dict = @{@"KongOrDuo":@"",@"price":_marketmodel.current,@"BaoZJin":@"898798",@"shouxuFei":@"12.434",@"isSelectedJY":@"1"};
    }else{
          dict = @{@"KongOrDuo":@"Kong",@"price":_marketmodel.current,@"BaoZJin":@"898798",@"shouxuFei":@"12.434",@"isSelectedJY":@"0"};
        
    }
    
    COCTransViewController * sub  = [[COCTransViewController alloc]init];
    sub.hidesBottomBarWhenPushed = YES;
    [sub creatDataWith:dict];
    [self.navigationController pushViewController:sub animated:YES];
    

    
}
- (void)chartViewNeedLoadNewData:(HSStockChartView *)chartView complete:(void (^)(NSArray * array))complete{
    
    
}
- (void)selectItem:(UISegmentedControl *)sender {
   
    [self getModelArray:sender.selectedSegmentIndex];
}
-(void)getModelArray:(NSInteger)tag{
    
    
    NSArray * timeArr = @[@"1",@"3",@"5",@"15",@"60"];
    
    
    weakSelf(self);
    [[ASOHTTPRequest sharedInstance] oneGet: [NSString stringWithFormat:@"%@%@&type=%@min",getMarketLineTime,_marketmodel.product_code, timeArr[tag]] path:@"" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        
        NSString * result = responseObject[@"result"];
        if ([result isEqualToString:@"Y"]) {
            
            NSArray * dataArray = responseObject[@"data"];
            
            
            
            HSStockChartModelGroup * group = [[HSStockChartModelGroup alloc] init];
            //此处array为HSStockChartModel数组，需要时间，开盘价，收盘价，最高价，最低价，出货量，日均线数据会自动算出
            group.chartModelArray =[HSStockChartModel getmodelWithArrayString:dataArray]; ;
            
            weakSelf.chartView.modelGroup = group;
            [weakSelf.chartView reloadData];
            
        }else{
            
            
            
        }
        
        
    } faile:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}


@end
