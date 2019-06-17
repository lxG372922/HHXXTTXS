//
//  MarketModelHX.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MarketModelHX : NSObject
///时间戳
@property(nonatomic,assign) NSInteger market_time;
///code
@property(nonatomic,copy) NSString *  product_code;
@property(nonatomic,copy) NSString *  current;//当前价
@property(nonatomic,copy) NSString *  open;//开盘
@property(nonatomic,copy) NSString *  high;//最高
@property(nonatomic,copy) NSString *  low;//最低
@property(nonatomic,copy) NSString *  max;//最大
@property(nonatomic,copy) NSString *  min;//最小
@property(nonatomic,copy) NSString *  y_close; //
@property(nonatomic,copy) NSString *  close; //闭盘
@property(nonatomic,copy) NSString *  buy1;//买1
@property(nonatomic,copy) NSString *  buy2;
@property(nonatomic,copy) NSString *  buy3;
@property(nonatomic,copy) NSString *  buy4;
@property(nonatomic,copy) NSString *  buy5;
@property(nonatomic,copy) NSString *  sell1;//卖1
@property(nonatomic,copy) NSString *  sell2;
@property(nonatomic,copy) NSString *  sell3;
@property(nonatomic,copy) NSString *  sell4;
@property(nonatomic,copy) NSString *  sell5;
@property(nonatomic,copy) NSString *  buy_vol1; //买1量
@property(nonatomic,copy) NSString *  buy_vol2;
@property(nonatomic,copy) NSString *  buy_vol3;
@property(nonatomic,copy) NSString *  buy_vol4;
@property(nonatomic,copy) NSString *  buy_vol5;
@property(nonatomic,copy) NSString *  sell_vol1;//卖1量
@property(nonatomic,copy) NSString *  sell_vol2;
@property(nonatomic,copy) NSString *  sell_vol3;
@property(nonatomic,copy) NSString *  sell_vol4;
@property(nonatomic,copy) NSString *  sell_vol5;
@property(nonatomic,copy) NSString *  total_volume;//交易总量
@property(nonatomic,copy) NSString *  total_amount;//交易总价
@property(nonatomic,copy) NSString *  current_volume;//当前量
@property(nonatomic,copy) NSString *  y_openinterest; //持仓量
@property(nonatomic,copy) NSString *  is_trade_time;

+(NSDictionary*)codeForName;
@end

NS_ASSUME_NONNULL_END
