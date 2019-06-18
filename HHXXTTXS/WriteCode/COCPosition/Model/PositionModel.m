//
//  PositionModel.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "PositionModel.h"
#import "NSObject+XsyCoding.h"
@implementation PositionModel
XSYCodingImplementation
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [self yy_modelEncodeWithCoder:aCoder];
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    return [self yy_modelInitWithCoder:aDecoder];
//}
//
//- (NSString *)description
//{
//    return [self yy_modelDescription];
//}

+ (instancetype)createModelWithData:(NSDictionary *)dataDict{
    
    PositionModel *model = nil;
    if (dataDict && [dataDict isKindOfClass:[NSDictionary class]]) {
        model = [[PositionModel alloc] init];
        model.pro_Name = [dataDict objectForKey:@"name"];
        model.pro_shou = [dataDict objectForKey:@"totalHands"];
        model.pro_duoOrKong = [dataDict objectForKey:@"pl_Rate"];
        model.pro_Price = [dataDict objectForKey:@"pl_Rate"];
        model.pro_KCPrice = [dataDict objectForKey:@"avgPrice"];
        model.pro_nowPrice = [dataDict objectForKey:@"currentPrice"];
        model.pro_zhiyPrice = [dataDict objectForKey:@"saveIdentifier"];
        model.pro_zhisPrice = [dataDict objectForKey:@"saveIdentifier"];
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
