//
//  PostHeaderView.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class COCHostModel;
NS_ASSUME_NONNULL_BEGIN

@interface PostHeaderView : UIView
@property (nonatomic,strong) UILabel *totailLabel;//浮动动盈亏
@property (nonatomic,strong) UILabel *totaijinE;//浮动动盈亏j金额
@property (nonatomic,strong) UILabel *aviableLabel;//可用资金
@property (nonatomic,strong) UILabel *aviablejinE;//可用金额
@property (nonatomic,strong) UILabel *bondCaLabel;//持仓保证金
@property (nonatomic,strong) UILabel *bondjinE;//保证金额
@property (nonatomic,strong) UILabel *netCapLabel;//资产净值
@property (nonatomic,strong) UILabel *netCapjinE;

-(instancetype)initWithDataModel:(COCHostModel*)model oiginY:(CGFloat)oiginY;
@end

NS_ASSUME_NONNULL_END
