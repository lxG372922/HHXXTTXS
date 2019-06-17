//
//  PositionModel.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "PositionModel.h"

@implementation PositionModel

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

+ (instancetype)createModelWithData:(NSDictionary *)dataDict{
    
    PositionModel *model = nil;
    if (dataDict && [dataDict isKindOfClass:[NSDictionary class]]) {
        model = [[PositionModel alloc] init];
        model.pro_Name = [dataDict objectForKey:@"pro_Name"];
        model.pro_shou = [dataDict objectForKey:@"pro_shou"];
        model.pro_duoOrKong = [dataDict objectForKey:@"pro_duoOrKong"];
        model.pro_Price = [dataDict objectForKey:@"pro_Price"];
        model.pro_KCPrice = [dataDict objectForKey:@"pro_KCPrice"];
        model.pro_nowPrice = [dataDict objectForKey:@"pro_nowPrice"];
        model.pro_zhiyPrice = [dataDict objectForKey:@"pro_zhiyPrice"];
        model.pro_zhisPrice = [dataDict objectForKey:@"pro_zhisPrice"];
    }
    return model;
}

///数据转化 double 转保留两位小数的string
+(NSString*)changeDoubleToString:(NSString*)dou{
    
    double doul = [dou doubleValue];
    if (doul>0) {
        return [NSString stringWithFormat:@"%0.2f",doul];
    }
    return @"";
    
}
@end
