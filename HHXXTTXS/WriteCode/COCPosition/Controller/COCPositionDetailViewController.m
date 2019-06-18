//
//  COCPositionDetailViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCPositionDetailViewController.h"
#import "GLPositionModel.h"
@interface COCPositionDetailViewController ()

@end

@implementation COCPositionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    /*
     @property (nonatomic,weak)IBOutlet UILabel *proPzLabel;//交易品种
     @property (nonatomic,weak)IBOutlet UILabel *fangXLabel;//交易方向
     @property (nonatomic,weak)IBOutlet UILabel *wtNumLabel;//委托数量
     @property (nonatomic,weak)IBOutlet UILabel *cjNumLabel;//成交数量
     @property (nonatomic,weak)IBOutlet UILabel *jyzhfLabel;//交易综合费用
     @property (nonatomic,weak)IBOutlet UILabel *baoZLabel;//保证金
     @property (nonatomic,weak)IBOutlet UILabel *junJLabel;//开仓均价
     @property (nonatomic,weak)IBOutlet UILabel *leiXLabel;//开仓类型
     @property (nonatomic,weak)IBOutlet UILabel *kcTimeLabel;//开仓时间
     @property (nonatomic,weak)IBOutlet UILabel *dingDLabel;//订单编号
     */
    self.proPzLabel.text = self.dataModel.name;
    if ((self.dataModel.positionType = ContractPositionTypeLong)) {
        self.fangXLabel.text = @"买多";
    }else if((self.dataModel.positionType = ContractTradeTypeOpenShort)){
        self.fangXLabel.text = @"买空";
    }
    self.wtNumLabel.text = self.dataModel.totalHands;
    self.cjNumLabel.text = self.dataModel.totalHands;
    self.jyzhfLabel.text = self.dataModel.pl;
    self.baoZLabel.text = self.dataModel.margin;
    self.junJLabel.text = self.dataModel.avgPrice;
    // Do any additional setup after loading the view from its nib.
}

-(void)updatelabelDataWith:(GLPositionModel *)dataModel
{
    self.dataModel = dataModel;
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
