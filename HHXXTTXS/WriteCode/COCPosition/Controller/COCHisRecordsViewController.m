//
//  COCHisRecordsViewController.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCHisRecordsViewController.h"
#import "GLPositionModel.h"
@interface COCHisRecordsViewController ()
@property (nonatomic,strong) GLPositionModel *dataModel;

@end

@implementation COCHisRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    
    /*
     *@property (nonatomic,weak)IBOutlet UILabel *kanduoLabel;
     @property (nonatomic,weak)IBOutlet UILabel *ykLabel;//盈亏值
     @property (nonatomic,weak)IBOutlet UILabel *bilieLabel;//盈亏比列
     @property (nonatomic,weak)IBOutlet UILabel *pingZLabel;//交易品种
     @property (nonatomic,weak)IBOutlet UILabel *fangXLabel;//交易方向
     @property (nonatomic,weak)IBOutlet UILabel *numberLabel;//交易数量
     @property (nonatomic,weak)IBOutlet UILabel *baoZLabel;//保证金
     @property (nonatomic,weak)IBOutlet UILabel *shouxuLabel;//手续费
     @property (nonatomic,weak)IBOutlet UILabel *kcPriceLabel;//开仓均价
     @property (nonatomic,weak)IBOutlet UILabel *leixLabel;//开仓类型
     @property (nonatomic,weak)IBOutlet UILabel *pcPriceLabel;//平仓均价
     @property (nonatomic,weak)IBOutlet UILabel *kclxLabel;//平仓类型
     @property (nonatomic,weak)IBOutlet UILabel *kcTimeLabel;//开仓时间
     @property (nonatomic,weak)IBOutlet UILabel *pcTimeLabel;//平仓时间
     @property (nonatomic,weak)IBOutlet UILabel *orderLabel;//订单编号
     
     
     availableHands = <nil>;
     avgPrice = "786";
     avgTime = "2019-06-18 06:24:42";
     currentPrice = <nil>;
     identifier = "i1909";
     lever = "1";
     margin = "15720";
     marketValue = "15720";
     name = "铁矿";
     pl = "0.00";
     pl_Rate = "0";
     positionType = 1;
     saveIdentifier = "i1909_1";
     totalHands = "20";
     zhiSPrice = "20";
     zhiYPrice = "20"
     
     */
    if (self.dataModel.positionType == 1) {
        self.kanduoLabel.text = @"买多";
        self.fangXLabel.text = @"买多";
        self.leixLabel.text= @"买多";
        self.kclxLabel.text =  @"买多";
    }else{
         self.kanduoLabel.text = @"买空";
         self.fangXLabel.text = @"买空";
        self.leixLabel.text= @"买空";
        self.kclxLabel.text =  @"买空";
    }
    self.ykLabel.text = self.dataModel.pl;
    CGFloat plValue = ([self.dataModel.currentPrice floatValue] - [self.dataModel.avgPrice floatValue]);
    self.ykLabel.text = [NSString stringWithFormat:@"%.2f",plValue];
    self.bilieLabel.text = self.dataModel.pl_Rate;
    self.pingZLabel.text = self.dataModel.name;
    self.numberLabel.text = self.dataModel.totalHands;
    self.baoZLabel.text = self.dataModel.margin;
    self.kcPriceLabel.text = self.dataModel.marketValue;
    self.pingZLabel.text = self.dataModel.name;
    self.pcPriceLabel.text = self.dataModel.currentPrice;
    self.kcPriceLabel.text = self.dataModel.avgPrice;
    self.kcTimeLabel.text = self.dataModel.avgTime;

//    self.shouxuLabel.text =self.dataModel.
    
//    self.kanduoLabel.text = self.dataModel.
    
    // Do any additional setup after loading the view from its nib.
}

-(void)updatelabelDataWith:(GLPositionModel *)dataModel{
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
