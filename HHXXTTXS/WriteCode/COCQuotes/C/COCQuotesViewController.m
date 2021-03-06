//
//  COCQuotesViewController.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCQuotesViewController.h"
#import "MarketModelHX.h"
#import <MJExtension.h>
#import "XSYTableView.h"
#import "MarketDetailsViewController.h"
@interface COCQuotesViewController ()<XjhClickTypeDelegate>
@property(nonatomic,copy)NSArray * xjhDaraArray;
@property(nonatomic,strong) XSYTableView * xjh_tableview ;
@end

@implementation COCQuotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self xjh_CreatMarketUi];
    [self xjh_getDataMarket];
}
-(void)xjh_CreatMarketUi{
    
    _xjh_tableview = [[XSYTableView alloc] initWithCustomFrame:CGRectMake(0, Nav_topH, SCREEN_Width, SCREEN_Height-Nav_topH-Tab_H)];
    if (@available(iOS 11.0, *)) {
        _xjh_tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    _xjh_tableview.xjhDelegate = self;
    [self.view addSubview:_xjh_tableview];
    
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(xjh_getDataMarket) name:@"xjhtableview" object:nil];
    
}
-(void)xjh_getDataMarket{
    
    [SVProgressHUD show];
    
    weakSelf(self);
    [[ASOHTTPRequest sharedInstance] oneGet:GetCodeDetails path:@"" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        
        NSString * result = responseObject[@"result"];
        if ([result isEqualToString:@"Y"]) {
            
            weakSelf.xjhDaraArray = [MarketModelHX mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
            
            [weakSelf.xjh_tableview UpDateTalbeViewWitharray: weakSelf.xjhDaraArray];
            
        NSDictionary * dict =  [[ContractManager manager] positions];
            for (NSString * str in dict.allKeys) {
                
                NSString * sttt = [str stringByReplacingOccurrencesOfString:@"_1" withString:@""];
               sttt = [sttt stringByReplacingOccurrencesOfString:@"_2" withString:@""];
                for (MarketModelHX * mod in weakSelf.xjhDaraArray) {
                    if ([mod.product_code isEqualToString: sttt]) {
                        
                        [[ContractManager manager] updateNewPrice:mod.current forIdentifier:sttt];
                        continue;
                    }
                }
                
                
            }
            
            
        }else{
            
            [SVProgressHUD showErrorWithStatus:NoDataAndTouchRefresh];
            [weakSelf.xjh_tableview UpDateTalbeViewWitharray: @[]];
        }
        
        
        
    } faile:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:NoDataAndTouchRefresh];
        [weakSelf.xjh_tableview UpDateTalbeViewWitharray: @[]];
    }];
    
}

-(void)ClickTableRowWithModel:(id)model{
    
    MarketModelHX * mod = model;
    MarketDetailsViewController * market  = [[MarketDetailsViewController alloc]init];
    market.hidesBottomBarWhenPushed = YES;
    market.marketmodel = mod;
    NSDictionary * dicts = [MarketModelHX codeForName];
    market.marketName = dicts[mod.product_code];
    [self.navigationController pushViewController:market animated:YES];
    
    
    
}

@end
