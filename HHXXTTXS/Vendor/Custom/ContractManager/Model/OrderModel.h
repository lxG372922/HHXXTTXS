//
//  OrderModel.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

/*
 交易模型
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ContractTradeTypeOpenLong = 1,          // 买入开多(买)
    ContractTradeTypeOpenShort,             // 卖出开空(卖)
    ContractTradeTypeCloseLong,             // 卖出平多(卖)
    ContractTradeTypeCloseShort             // 买入平空(买)
} ContractTradeType;

@interface OrderModel : NSObject<NSCoding>

/** name */
@property (strong, nonatomic) NSString *name;

/** symbol */
@property (strong, nonatomic) NSString *symbol;

/** 唯一标识符 */
@property (strong, nonatomic) NSString *identifier;

/** 交易价格 */
@property (strong, nonatomic) NSString *tradePrice;

/** 交易手数 */
@property (strong, nonatomic) NSString *tradeHands;

/** 交易类型  */
@property (assign, nonatomic) ContractTradeType tradeType;

/** 杠杆 */
@property (strong, nonatomic) NSString *lever;

/** 止盈价*/
@property (strong, nonatomic) NSString *zhiYPrice;

/** 止损价 */
@property (strong, nonatomic) NSString *zhiSPrice;

/** 开仓时间 */
@property (strong, nonatomic) NSString *avgTime;

#pragma mark - 扩展属性 --

/** save identifier */
@property (strong, nonatomic) NSString *saveIdentifier;

/** 交易额 */
@property (strong, nonatomic) NSString *tradeAmount;

@end

NS_ASSUME_NONNULL_END
