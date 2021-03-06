#import "COCHomeMarketViewController.h"
#import "COCHomeMarketTableViewCell.h"
#import "COCHomeModel.h"
#import "COCMarketHeaderView.h"
#import "XSYTableView.h"
#import "MarketModelHX.h"
#import "MarketDetailsViewController.h"
#import <MJExtension.h>
@interface COCHomeMarketViewController ()<XjhClickTypeDelegate>
@property(nonatomic,copy)NSArray * xjhDaraArray;
@property(nonatomic,strong) XSYTableView * xjh_tableview ;
@end

@implementation COCHomeMarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self xjh_CreatMarketUi];
    [self xjh_getDataMarket];
}
-(void)viewWillAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
}

-(void)xjh_CreatMarketUi{
    
    _xjh_tableview = [[XSYTableView alloc] initWithCustomFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-Nav_topH-Tab_H)];
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
