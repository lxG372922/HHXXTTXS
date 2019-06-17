//
//  COCPositionHostViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCPositionHostViewController.h"

@interface COCPositionHostViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong)UITableView *holdPos_tableView;
@property (nonatomic , strong)NSArray *holdPosArray;


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
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}


#pragma  -------------lazy----------------

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
    [self.holdPos_tableView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
    [self.holdPos_tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    COCHostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:communityReportCell_id_1];
    if(!cell){
        cell = [[COCHostTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:communityReportCell_id_1];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

//    [cell setNewsTableViewCellControlContentWithModel:dic];

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
