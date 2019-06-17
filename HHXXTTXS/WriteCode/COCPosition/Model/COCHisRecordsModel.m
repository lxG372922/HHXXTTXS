//
//  COCHisRecordsModel.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCHisRecordsModel.h"

@implementation COCHisRecordsModel

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
  
    COCHisRecordsModel *model = nil;
    if (dataDict && [dataDict isKindOfClass:[NSDictionary class]]) {
        model = [[COCHisRecordsModel alloc] init];
        model.pro_Name = [dataDict objectForKey:@"pro_Name"];
        model.pro_shou = [dataDict objectForKey:@"pro_shou"];
        model.pro_duoOrKong = [dataDict objectForKey:@"pro_duoOrKong"];
        model.pro_Time = [dataDict objectForKey:@"pro_Time"];
        model.pro_style = [dataDict objectForKey:@"pro_style"];
        model.pro_JSYKSPrice = [dataDict objectForKey:@"pro_JSYKSPrice"];
        model.pro_roatePoint = [dataDict objectForKey:@"pro_roatePoint"];
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
