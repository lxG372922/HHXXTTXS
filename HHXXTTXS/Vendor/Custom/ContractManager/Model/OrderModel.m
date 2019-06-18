//
//  OrderModel.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel
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

@end
