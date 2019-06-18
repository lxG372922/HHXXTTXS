//
//  GLPositionModel.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "GLPositionModel.h"


@implementation GLPositionModel

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self yy_modelEncodeWithCoder:aCoder];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self yy_modelInitWithCoder:aDecoder];
}

- (NSString *)description
{
    return [self yy_modelDescription];
}



- (NSString *)margin {
    
    if (!isStrEmpty(self.lever) && !isStrEmpty(self.totalHands) && !isStrEmpty(self.avgPrice)) {
        
        CGFloat marginValue = [_totalHands integerValue] * [_avgPrice floatValue] * (1.0f / [_lever floatValue]);
        
        _margin = [@(marginValue) stringValue];
    }else {
        _margin = @"0";
    }
    
    return _margin;
}

- (NSString *)saveIdentifier {
    
    if (!_saveIdentifier) {
        _saveIdentifier = [NSString stringWithFormat:@"%@_%@",self.identifier,[@(self.positionType) stringValue]];
    }
    return _saveIdentifier;
}

- (NSString *)pl {
    
    if (!isStrEmpty(self.avgPrice) && !isStrEmpty(self.totalHands) && !isStrEmpty(self.currentPrice)) {
        
        CGFloat plValue = ([_currentPrice floatValue] - [_avgPrice floatValue]) * [_totalHands integerValue];
        
        if (_positionType == ContractPositionTypeShort) {
            plValue = plValue * (- 1.0f);
        }
        
        _pl = [@(plValue) stringValue];
        
    }else {
        _pl = @"0.00";
    }
    
    return _pl;
}

- (NSString *)pl_Rate {
    
    if (!isStrEmpty(self.pl)) {
        
        CGFloat plRate = [self.pl floatValue] / [self.margin floatValue];
        
        _pl_Rate = [@(plRate) stringValue];
    }
    
    return _pl_Rate;
}

- (NSString *)marketValue {
    
    if (!isStrEmpty(self.margin) && !isStrEmpty(self.pl)) {
        
        CGFloat marketValue = [self.margin floatValue] + [self.pl floatValue];
        if (marketValue <= 0) {
            _marketValue = @"0.0";
        }else {
            _marketValue = [@(marketValue) stringValue];
        }
    }else {
        _marketValue = @"0.0";
    }
    
    return _marketValue;
}



/** 从委托订单创建一个持仓模型 */
+ (instancetype)createPositionWithOrderModel:(OrderModel *)orderModel {
    
    GLPositionModel *model = nil;
    
    if (orderModel) {
        model = [[GLPositionModel alloc] init];
        [model updateWithOrderModel:orderModel];
    }
    return model;
}

/**
 根据订单模型更新持仓模型
 
 @param orderModel 订单模型
 */
- (void)updateWithOrderModel:(OrderModel *)orderModel {
    
    if (orderModel) {
        self.zhiYPrice =orderModel.zhiYPrice;
        self.zhiSPrice =orderModel.zhiSPrice;
        self.avgTime =orderModel.avgTime;
        self.identifier = orderModel.identifier;
        self.name = orderModel.name;
        self.lever = orderModel.lever;
        switch (orderModel.tradeType) {
            case ContractTradeTypeOpenLong:
            {
                self.totalHands = [@([self.totalHands integerValue] + [orderModel.tradeHands integerValue]) stringValue];
                self.avgPrice = [@((([orderModel.tradeHands integerValue] * [orderModel.tradePrice floatValue]) + ([self.avgPrice floatValue] * [self.totalHands integerValue])) / [self.totalHands floatValue]) stringValue];
                self.positionType = ContractPositionTypeLong;
            }
                break;
                
            case ContractTradeTypeCloseLong:
            {
                NSInteger totalHands = [self.totalHands integerValue] - [orderModel.tradeHands integerValue];
                self.totalHands = [@(totalHands > 0 ? totalHands : 0) stringValue];
                self.positionType = ContractPositionTypeLong;
            }
                break;
                
            case ContractTradeTypeOpenShort:
            {
                self.totalHands = [@([self.totalHands integerValue] + [orderModel.tradeHands integerValue]) stringValue];
                self.avgPrice = [@((([orderModel.tradeHands integerValue] * [orderModel.tradePrice floatValue]) + ([self.avgPrice floatValue] * [self.totalHands integerValue])) / [self.totalHands floatValue]) stringValue];
                self.positionType = ContractPositionTypeShort;
            }
                break;
                
            case ContractTradeTypeCloseShort:
            {
                NSInteger totalHands = [self.totalHands integerValue] - [orderModel.tradeHands integerValue];
                self.totalHands = [@(totalHands > 0 ? totalHands : 0) stringValue];
                self.positionType = ContractPositionTypeShort;
            }
                break;
        }
    }
}

/**
 是否可以使用此类型的委托模型更新持仓模型
 
 @param tradeType 交易类型
 */
- (BOOL)isCanUpdateWithOrderTradeType:(ContractTradeType)tradeType {
    
    BOOL can = NO;
    if (self.positionType && tradeType) {
        
        switch (self.positionType) {
            case ContractPositionTypeLong:
            {
                if (tradeType == ContractTradeTypeOpenLong || tradeType == ContractTradeTypeCloseLong) {
                    can = YES;
                }
            }
                break;
            case ContractPositionTypeShort:
            {
                if (tradeType == ContractTradeTypeOpenShort || tradeType == ContractTradeTypeCloseShort) {
                    can = YES;
                }
            }
                break;
        }

    }
    return can;
}

@end
