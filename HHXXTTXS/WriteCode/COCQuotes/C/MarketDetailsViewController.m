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
@interface MarketDetailsViewController ()<HSStockChartViewDelegate>
@property(nonatomic,strong)detailsTopView * topView;
@property(nonatomic,strong) BottomView * bottomView ;
@property(nonatomic,strong) HSStockChartView * chartView ;

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
    
    
    //尾
    _bottomView =[[BottomView alloc] initWithPrince:_marketmodel.current maneyALl:@"789890" buyAction:^{
        
    } clickCenBtn:^{
        
    } sellAction:^{
        
    }];
    
    [self.view addSubview:_bottomView];
    
    //line
    _chartView = [[HSStockChartView alloc] initWithFrame:CGRectMake(0, _topView.height+Nav_topH, SCREEN_WIDTH, SCREEN_HEIGHT-Nav_topH-_topView.height-_bottomView.height)];
    _chartView.delegate = self;
    [self.view addSubview:_chartView];
    
   
    [self getModelArray];
    
   
    
}
- (void)chartViewNeedLoadNewData:(HSStockChartView *)chartView complete:(void (^)(NSArray * array))complete{
    
    
}

-(void)getModelArray{
    
    
    weakSelf(self);
    [[ASOHTTPRequest sharedInstance] oneGet: [NSString stringWithFormat:@"%@%@&type=%@min",getMarketLineTime,_marketmodel.product_code, @"15"] path:@"" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
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
