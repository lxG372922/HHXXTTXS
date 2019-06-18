//
//  COCHomeAboutUsViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/18.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCHomeAboutUsViewController.h"
#import <StoreKit/StoreKit.h>

@interface COCHomeAboutUsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *headerV;
@property (strong, nonatomic) UITableView *zTableView;
@end

@implementation COCHomeAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
    [self configTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)configTableView{
    self.zTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.zTableView.delegate = self;
    self.zTableView.dataSource = self;
    [self.view addSubview:self.zTableView];
    self.zTableView.rowHeight = 50;
    self.headerV.frame = CGRectMake(0, 0, SCREEN_Width, 200);
    self.zTableView.tableHeaderView = self.headerV;
    
    [self.zTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    NSArray *titleArr = @[@"去评分",@"服务协议",@"版本信息"];
    cell.textLabel.text = titleArr[indexPath.row];
    
    if (indexPath.row == 2) {
        cell.detailTextLabel.text = @"1.0.0";
    }else{
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self gotoCommit];
    }
}

// 给个好评
-(void)gotoCommit{
    if (@available(iOS 10.3, *)) {
        [SKStoreReviewController requestReview];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]init];
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]init];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}


@end
