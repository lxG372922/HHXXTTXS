//
//  COCTransViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCTransViewController.h"
#import "COCTrasTableViewCell.h"
#import "ContractManager.h"
#import "OrderModel.h"
#import "UIViewPopAlert.h"
@interface COCTransViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *dataArray;//创建一个数据源数组
    NSMutableDictionary *dic;//创建一个字典进行判断收缩还是展开
    NSArray *sectionArr;//分组的名字
    NSIndexPath * _seleIndex;
    NSArray *fanWArray;
    NSArray *btnSTitleArray;
    NSArray *colorArray;
    //初始化为
    NSDictionary *dataDic;
    NSString * kongorDuo;

}

@property (nonatomic,strong)UITableView *tableView;
@property  (nonatomic,strong) UIView *footView;
@property (nonatomic,strong) UIButton *commitBtn;
@property (nonatomic,strong)  UILabel *kongORDuoLabel;
@property (nonatomic,strong)  UILabel *priceLabel;
@property (nonatomic,strong)  UILabel *baoZJinlabel;
@property (nonatomic,strong)  UILabel * shouxulabel;
@end
static NSString *const communitypostionCell_id= @"communitypostionCell_id";
@implementation COCTransViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    dic = [NSMutableDictionary dictionary];
    dataArray = @[@"每次跳动=¥10",@"参考价格1136.6",@"参考价格1136.6"];
    sectionArr = @[@"手数",@"止损",@"止盈"];
    fanWArray = @[@"(范围1-20手)",@"(范围100.00 - 600.00)",@"(范围300.00 - 1800.00)"];
    btnSTitleArray = @[@[@"1",@"2",@"5",@"10",@"15",@"20"],@[@"¥100",@"¥150",@"¥200",@"¥300",@"¥450",@"¥600"],@[@"¥300",@"¥450",@"¥600",@"¥900",@"¥1350",@"¥1800"]];

    [self.view addSubview:self.tableView];
    [self.view addSubview:self.commitBtn];
}


-(void)commitClick{
    //
    
    COCTrasTableViewCell * cell1 = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
     COCTrasTableViewCell * cell2 = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
     COCTrasTableViewCell * cell3 = [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
    
    //判读金额 是否可以买入卖出
    NSString * jinestr = [[ContractManager manager] getCurrentAvailCaptital];
    CGFloat jine = [jinestr floatValue];
    CGFloat shu = [cell1.infoTextTF.text floatValue];
    CGFloat price = [_marketmodel.current floatValue];
    
    if (jine<(shu*price)) {
        
        int maxNum = jine/price;
        [UIViewPopAlert pushAlertOneActionViewWithMessage:@"" Target:self Title:[NSString stringWithFormat:@"目前持有金额：%@\n最大交易量为：%d",jinestr,maxNum] oneAlertTitle:@"知道了" ChangeSystem:NO oneActionfunc:^{
            
        }];
        return;
        
    }
    
    OrderModel * mode = [OrderModel new];
    mode.name = _marketName;
    mode.symbol = _marketmodel.product_code;
    mode.tradePrice = _marketmodel.current;
    mode.tradeHands = cell1.infoTextTF.text;
    mode.identifier = _marketmodel.product_code;
//    mode.tradeAmount =[NSString stringWithFormat:@"%0.02f",jine*shu];
    mode.zhiYPrice = cell2.infoTextTF.text;
    mode.zhiSPrice = cell3.infoTextTF.text;
    mode.avgTime =[FAPHelp getNowTime1];

    NSString * show;
    
    if ([kongorDuo isEqualToString:@"Duo"]  ) {
    
        mode.tradeType = ContractTradeTypeOpenLong;
        show = @"买多";
    }else{
        show = @"卖空";
      mode.tradeType = ContractTradeTypeOpenShort;
    }
    
     [[ContractManager manager]addOrderWithModel:mode];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"%@交易成功",show]];
    });
}

-(void)creatDataWith:(NSDictionary *)dic{
    self.kongORDuoLabel.text = [dic objectForKey:@"KongOrDuo"];//买多或卖空
    self.priceLabel.text = _marketmodel.current;//价格
    self.baoZJinlabel.text = [dic objectForKey:@"BaoZJin"];//保证金
    self.shouxulabel.text = [dic objectForKey:@"shouxuFei"];//手续费
    dataDic = [NSDictionary dictionaryWithDictionary:dic];
    NSString *  isJiaoY = [dic objectForKey:@"isSelectedJY"];
    kongorDuo = [dic objectForKey:@"KongOrDuo"];
    
    if ([kongorDuo isEqualToString:@"Duo"]) {
        [self.commitBtn setBackgroundColor:RGB(248, 114, 83)];
        self.kongORDuoLabel.alpha = 1;
        self.priceLabel.alpha = 1;
        _kongORDuoLabel.text = @"买多";
        
    }else if([kongorDuo isEqualToString:@"Kong"]){
        [self.commitBtn setBackgroundColor:RGB(26, 164, 112)];
        self.kongORDuoLabel.alpha = 1;
        self.priceLabel.alpha = 1;
        _kongORDuoLabel.text = @"卖空";
        
    }else{
        [self.commitBtn setTitle:@"请开启" forState:UIControlStateNormal];
        [self.commitBtn setBackgroundColor:RGB(20, 44, 51)];
        self.kongORDuoLabel.alpha = 0;
        self.priceLabel.alpha = 0;
        _kongORDuoLabel.text = @"";
    }
    [_tableView reloadData];
}

//懒加载


-(UIButton *)commitBtn{
    if (!_commitBtn) {
        _commitBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        _commitBtn.frame = CGRectMake(20, SCREEN_HEIGHT - Tab_H - 20, SCREEN_WIDTH - 40, 40);
        _commitBtn.layer.cornerRadius = 5;
        [_commitBtn setBackgroundColor:[UIColor orangeColor]];
//        [_commitBtn setTitle:@"请开启" forState:UIControlStateNormal];
        [_commitBtn addTarget:self action:@selector(commitClick) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *kongORDuoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, SCREEN_WIDTH - 40, 10)];
        kongORDuoLabel.textColor = [UIColor whiteColor];
        kongORDuoLabel.font = FONT(12);
        kongORDuoLabel.textAlignment = NSTextAlignmentCenter;
        kongORDuoLabel.text = @"买多";
        self.kongORDuoLabel = kongORDuoLabel;
        [_commitBtn addSubview:kongORDuoLabel];
        
        UILabel *priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(kongORDuoLabel.frame) +5, SCREEN_WIDTH - 40, 20)];
        priceLabel.textColor = [UIColor whiteColor];
        priceLabel.font = FONT(14);
        priceLabel.textAlignment = NSTextAlignmentCenter;
        priceLabel.text = _marketmodel.current;
        self.priceLabel = priceLabel;
        [_commitBtn addSubview:priceLabel];
        
    }
    return _commitBtn;
}
- (UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 400) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
      _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
         [_tableView registerNib:[UINib nibWithNibName:@"COCTrasTableViewCell" bundle:nil] forCellReuseIdentifier:communitypostionCell_id];
         UIView *footView = [[UIView alloc]init];
//        footView.backgroundColor =[UIColor orangeColor];
        footView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 80);
        
        UILabel *baoZlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH/2, 20)];
        baoZlabel.font = FONT(12);
        baoZlabel.textColor = [UIColor  grayColor];
        baoZlabel.text = @"冻结>保证金";
        [footView addSubview:baoZlabel];
        
        UILabel *baoZJinlabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - SCREEN_WIDTH/3 - 10 , 10, SCREEN_WIDTH/3, 20)];
        baoZJinlabel.font = FONT(12);
        self.baoZJinlabel = baoZJinlabel;
        baoZJinlabel.textAlignment = NSTextAlignmentRight;
        baoZJinlabel.textColor = [UIColor  grayColor];
        baoZJinlabel.text = [NSString stringWithFormat:@"¥%@",[dataDic objectForKey:@"BaoZJin"]];
        [footView addSubview:baoZJinlabel];
        
        
        UILabel *paylabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(baoZlabel.frame) + 10, SCREEN_WIDTH/2, 20)];
        paylabel.font = FONT(12);
        paylabel.textColor = [UIColor  grayColor];
        paylabel.text = @"支付>交易手续费";
        [footView addSubview:paylabel];
        
        UILabel *shouxulabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - SCREEN_WIDTH/3 - 10 , CGRectGetMaxY(baoZJinlabel.frame) + 10, SCREEN_WIDTH/3, 20)];
        shouxulabel.font = FONT(12);
        shouxulabel.textAlignment = NSTextAlignmentRight;
        shouxulabel.textColor = [UIColor  grayColor];
        self.shouxulabel = shouxulabel;
        shouxulabel.text = [NSString stringWithFormat:@"¥%@",[dataDic objectForKey:@"shouxuFei"]];;
        [footView addSubview:shouxulabel];
        
        self.tableView.tableFooterView = footView;
//        _tableView.backgroundColor = [UIColor blueColor];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (void)action_tap:(UIGestureRecognizer *)tap{
    NSString *str = [NSString stringWithFormat:@"%ld",tap.view.tag - 300];
    if ([dic[str] integerValue] == 0) {//如果是0，就把1赋给字典,打开cell
        [dic setObject:@"1" forKey:str];
    }else{//反之关闭cell
        [dic setObject:@"0" forKey:str];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:[str integerValue]]withRowAnimation:UITableViewRowAnimationFade];//有动画的刷新
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 60;
    COCTrasTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (_seleIndex == nil) {
        
        cell.btnView.hidden = YES;
        cell.fanWLabel.hidden = YES;
        cell.grayLabel.hidden = NO;
        return 59;
        
    }
    
    else
        
    {
        
        if (_seleIndex == indexPath) {
            cell.btnView.hidden = NO;
            cell.fanWLabel.hidden = NO;
            cell.grayLabel.hidden = YES;
            return 130;
            
        }else{
    
            cell.btnView.hidden = YES;
            cell.fanWLabel.hidden = YES;
            cell.grayLabel.hidden = NO;
            return 59;
            
        }
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    COCTrasTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:communitypostionCell_id];
    if (cell==nil) {
        cell = [[COCTrasTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:communitypostionCell_id];
        
    }
//    cell.backgroundColor = [UIColor orangeColor];
    cell.titleLabel.text = sectionArr[indexPath.row];
    if (indexPath.row == 0) {
        cell.tipLabel.text = dataArray[indexPath.row];
    }else{
        NSString *tipsString = [dataDic objectForKey:@"price"];
        cell.tipLabel.text = [NSString stringWithFormat:@"参考价%@",tipsString];
        cell.infoTextTF.text = @"100";
    }
    
    cell.fanWLabel.text = fanWArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell creatBtnWithTitle:btnSTitleArray[indexPath.row] idnexRow:indexPath.row ];
//    cell.textLabel.text = dataArray[indexPath.section][indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_seleIndex == indexPath) {
        COCTrasTableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        [cell setSelected:NO];
        _seleIndex = nil;
        
    }else{
        _seleIndex = indexPath;
        
    }
//    写个动画
    [UIView animateWithDuration:0.1 animations:^{[tableView beginUpdates];
        [tableView endUpdates];
    }];

}

@end
