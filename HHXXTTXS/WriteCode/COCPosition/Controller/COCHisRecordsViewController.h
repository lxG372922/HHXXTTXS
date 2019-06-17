//
//  COCHisRecordsViewController.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface COCHisRecordsViewController : COCBaseViewController
@property (nonatomic,weak)IBOutlet UILabel *kanduoLabel;
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
@end

NS_ASSUME_NONNULL_END
