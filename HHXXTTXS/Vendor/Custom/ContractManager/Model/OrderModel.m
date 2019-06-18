//
//  OrderModel.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

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


- (NSString *)lever {
    if (!_lever) {
        _lever = @"1";
    }
    return _lever;
}

- (NSString *)saveIdentifier {
    
    if (!_saveIdentifier) {
        _saveIdentifier = [NSString stringWithFormat:@"%@_%@",self.identifier,[self getTypeString]];
    }
    return _saveIdentifier;
}

- (NSString *)getTypeString {
    
    NSString *string = @"";
    
    switch (self.tradeType) {
        case ContractTradeTypeOpenLong:
            {
                string = @"1";
            }
            break;
            
        case ContractTradeTypeOpenShort:
        {
            string = @"2";
        }
            break;
            
        case ContractTradeTypeCloseLong:
        {
            string = @"1";
        }
            break;
            
        case ContractTradeTypeCloseShort:
        {
            string = @"2";
        }
            break;
    }
    
    
    return string;
}

- (NSString *)tradeAmount {
    if (isStrEmpty(_tradeAmount) || [_tradeAmount floatValue] <= 0) {
        CGFloat tradeAmount = ([self.tradePrice floatValue] * [self.tradeHands floatValue]) / [self.lever integerValue];
        _tradeAmount = [@(tradeAmount) stringValue];
    }
    return _tradeAmount;
}

@end
