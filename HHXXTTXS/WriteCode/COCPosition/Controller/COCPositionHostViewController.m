//
//  COCPositionHostViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCPositionHostViewController.h"
#import "OrderModel.h"
@interface COCPositionHostViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSDictionary * dicArray ;
}
@property (nonatomic , strong)UITableView *holdPos_tableView;
@property (nonatomic , strong)NSArray *holdPosArray;
@property (nonatomic,strong) UIView *noDataView;
@property (nonatomic,strong) OrderModel *postionModel;

@end
static NSString *const communityReportCell_id_1 = @"communityReportCell_id_1";
@implementation COCPositionHostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.holdPos_tableView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.holdPos_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).mas_offset(0);
        make.top.equalTo(self.view.mas_top).mas_offset(Nav_topH);
        make.right.equalTo(self.view.mas_right).mas_offset(0);
        make.bottom.equalTo(self.view.mas_bottom).mas_offset(0);
    }];
     [self.view addSubview:self.noDataView];
    // Do any additional setup after loading the view.
    
    
    [self reloadDataUI];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
   
}


#pragma  -------------lazy----------------
-(UIView *)noDataView{
    if (!_noDataView) {
        _noDataView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_Width - SCALE_Length(80.f))/2, (SCREEN_Height - SCALE_Length(120.f))/2, SCALE_Length(80.f), SCALE_Length(120.f))];
        _noDataView.backgroundColor = [UIColor clearColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fanchuan"]];
        imageView.frame = CGRectMake(0, 0, SCALE_Length(80), SCALE_Length(80));
        [_noDataView addSubview:imageView];
        UIButton *makeOrderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        makeOrderBtn.frame = CGRectMake(0, CGRectGetMaxY(imageView.frame) + 10, SCALE_Length(80.f), SCALE_Length(28.f));
        [makeOrderBtn setTitle:@"没有订单数据" forState:UIControlStateNormal];
//        [makeOrderBtn setBackgroundColor:BTNCOlor];
//        [makeOrderBtn addTarget:self action:@selector(makeOrderClick) forControlEvents:UIControlEventTouchUpInside];
        makeOrderBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [makeOrderBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_noDataView addSubview:makeOrderBtn];
        
    }
    return _noDataView;
}
-(UITableView *)holdPos_tableView{
    if(!_holdPos_tableView){
        _holdPos_tableView = [[UITableView alloc]init];
        _holdPos_tableView.delegate = self;
        _holdPos_tableView.dataSource = self;
        _holdPos_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _holdPos_tableView.backgroundColor = [UIColor clearColor];
         [_holdPos_tableView registerNib:[UINib nibWithNibName:@"COCHostTableViewCell" bundle:nil] forCellReuseIdentifier:communityReportCell_id_1];
        _holdPos_tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [SVProgressHUD show];
            [self performSelector:@selector(reloadDataUI) withObject:self afterDelay:1.5];
            
        }];
        
        _holdPos_tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            
            [SVProgressHUD show];
            
        }];
    }
    return _holdPos_tableView;
}

-(NSArray *)holdPosArray{
    if (!_holdPosArray) {
        _holdPosArray = [NSArray array];
    }
    return _holdPosArray;
}

-(void)reloadDataUI{
    dicArray  =  [[ContractManager manager] positions];
    if (dicArray.count > 0) {
//        self.postionModel =dicArray[];
        self.holdPos_tableView.alpha = 1;
        self.noDataView.alpha = 0;
    }else{
        self.holdPos_tableView.alpha = 0;
        self.noDataView.alpha = 1;
    }
    [self.holdPos_tableView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
    [self.holdPos_tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dicArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    COCHostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:communityReportCell_id_1];
    if(!cell){
        cell = [[COCHostTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:communityReportCell_id_1];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    [cell setPositionTableViewCellControlContentWithModel:dicArray[dicArray.allKeys[indexPath.row]]];

    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSDictionary *dic = self.holdPosArray[indexPath.row];
//    NSString *title = [dic objectForKey:@"title"];
//    CGSize titleSize  =[title boundingRectWithSize:CGSizeMake(SCREEN_Width - 30.00, CGFLOAT_MAX) fontSize:16];
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSDictionary *dic = self.holdPosArray[indexPath.row];
    COCHisRecordsViewController *hisVc = [[COCHisRecordsViewController alloc]init];
    hisVc.hidesBottomBarWhenPushed = YES;
    [hisVc updatelabelDataWith:dicArray[dicArray.allKeys[indexPath.row]]];
    [self.navigationController pushViewController:hisVc animated:YES];
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
