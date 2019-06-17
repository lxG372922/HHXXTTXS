//
//  detailsTopView.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketModelHX.h"
NS_ASSUME_NONNULL_BEGIN

@interface detailsTopView : UIView

@property(nonatomic,strong) NSTimer * timerxjh ;

@property(nonatomic,strong) UILabel * priceLabel ;
@property(nonatomic,strong) UILabel * chanPriceLabel ;
@property(nonatomic,strong) UILabel * changBaiPriceLabel ;
@property(nonatomic,strong) UILabel * buyColorlabel ;
@property(nonatomic,strong) UILabel * sellColorLabel ;

@property(nonatomic,strong) UILabel * buyNumLabel;
@property(nonatomic,strong) UILabel * sellNumLabel ;


///获取详情的顶部view
-(instancetype)initWithFrame:(CGFloat)top model:(nonnull MarketModelHX *)model;

@end

NS_ASSUME_NONNULL_END
