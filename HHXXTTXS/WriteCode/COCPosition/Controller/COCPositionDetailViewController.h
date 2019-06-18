//
//  COCPositionDetailViewController.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCBaseViewController.h"
@class GLPositionModel;
NS_ASSUME_NONNULL_BEGIN

@interface COCPositionDetailViewController : COCBaseViewController
@property (nonatomic,weak)IBOutlet UIView *backView;
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

@property (nonatomic,strong) GLPositionModel *dataModel;


-(void)updatelabelDataWith:(GLPositionModel *)dataModel;
@end

NS_ASSUME_NONNULL_END
