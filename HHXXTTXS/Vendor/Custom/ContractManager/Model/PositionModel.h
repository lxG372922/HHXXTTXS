//
//  PositionModel.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

/* 持仓模型 */

#import <Foundation/Foundation.h>
#import "OrderModel.h"
typedef enum : NSUInteger {
    ContractPositionTypeLong = 1,       // 多仓
    ContractPositionTypeShort           // 空仓
} ContractPositionType;

NS_ASSUME_NONNULL_BEGIN

@interface PositionModel : NSObject

/** 唯一标识符 */
@property (strong, nonatomic) NSString *identifier;

/** name */
@property (strong, nonatomic) NSString *name;

/** 仓位类型 */
@property (assign, nonatomic) ContractPositionType positionType;

/** 杠杆 */
@property (strong, nonatomic) NSString *lever;

/** 持仓量 */
@property (strong, nonatomic) NSString *totalHands;

/** 可平量 */
@property (strong, nonatomic) NSString *availableHands;

/** 开仓价 */
@property (strong, nonatomic) NSString *avgPrice;

/** 占用保证金 */
@property (strong, nonatomic) NSString *margin;

/** 当前价格 */
@property (strong, nonatomic) NSString *currentPrice;

#pragma mark - 扩展属性 ---

/** 收益率 */
@property (strong, nonatomic) NSString *pl_Rate;

/** 收益 */
@property (strong, nonatomic) NSString *pl;

/** 市值 */
@property (strong, nonatomic) NSString *marketValue;

/**
 根据订单模型更新持仓模型

 @param orderModel 订单模型
 */
- (void)updateWithOrderModel:(OrderModel *)orderModel;

/**
 是否可以使用此类型的委托模型更新持仓模型
 
 @param tradeType 交易类型
 */
- (BOOL)isCanUpdateWithOrderTradeType:(ContractTradeType)tradeType;
@end

NS_ASSUME_NONNULL_END
