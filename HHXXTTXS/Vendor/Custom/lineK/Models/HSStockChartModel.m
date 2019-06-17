//
//  HSStockChartModel.m
//  liantiao
//
//  Created by GZ GZ on 2018/3/19.
//  Copyright © 2018年 com.gz.liantiao. All rights reserved.
//

#import "HSStockChartModel.h"

@implementation HSStockChartModel

#pragma mark public

- (NSString *)generateDateStringByType:(HSKLineType)type{
    NSString * dateFomatter = @"";
    switch (type) {
        case HSKLineType1Min:
            dateFomatter = @"MM/dd HH:mm";
            break;
            
        case HSKLineType5Min:
            dateFomatter = @"MM/dd HH:mm";
            break;
            
        case HSKLineType15Min:
            dateFomatter = @"MM/dd HH:mm";
            break;
            
        case HSKLineType30Min:
            dateFomatter = @"MM/dd HH:mm";
            break;
            
        case HSKLineType1Hour:
            dateFomatter = @"MM/dd HH:mm";
            break;
            
        case HSKLineType1Day:
            dateFomatter = @"YYYY/MM/dd";
            break;
            
        case HSKLineType1Week:
            dateFomatter = @"MM/dd HH:mm";
            break;
            
        case HSKLineType1Month:
            dateFomatter = @"YYYY/MM";
            break;
            
        default:
            break;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFomatter];
    
    
    NSDate *returnDate = [NSDate dateWithTimeIntervalSince1970:self.date];
    NSString *returnDateStr = [formatter stringFromDate:returnDate];
    
    
    return returnDateStr;// [NSDate stringFromDateWithTimeInterval: dateFormatterString:];
}

+ (NSString *)getTypeStringByTimeType:(HSKLineType)type{
    switch (type) {
        case HSKLineType1Min:
            return @"1min";
            break;
            
        case HSKLineType5Min:
            return @"5min";
            break;
            
        case HSKLineType15Min:
            return @"15min";
            break;
            
        case HSKLineType30Min:
            return @"30min";
            break;
            
        case HSKLineType1Hour:
            return @"1hour";
            break;
            
        case HSKLineType1Day:
            return @"1day";
            break;
            
        case HSKLineType1Week:
            return @"1week";
            break;
            
        case HSKLineType1Month:
            return @"1month";
            break;
            
        default:
            return @"";
            break;
    }
}


#pragma mark getters
- (BOOL)isRise{
    return self.close - self.open >= 0;
}


///c通过数据字符串 得到model
+(NSArray*)getmodelWithArrayString:(NSArray*)array{
    
    NSMutableArray * Muta = [NSMutableArray array];
    for (NSString * str in array) {
        HSStockChartModel * mod = [HSStockChartModel new];
        NSArray * arr = [str componentsSeparatedByString:@","];
        mod.date = [arr[0] floatValue];
       
         mod.high = [arr[1] floatValue];
         mod.low = [arr[2] floatValue];
        mod.open = [arr[3] floatValue];
        mod.close = [arr[4] floatValue];
         mod.vol = [arr[5] floatValue];
        
        if (mod.open<mod.close) {
            mod.isRise = YES;
        }
        [Muta addObject:mod];
        
    }
    
    return Muta;
    
}

///传入字符串 返回两位小数的string
+(NSString*)getstringWithNumStr:(NSString*)str{
    
    CGFloat num = [str floatValue];
    return [NSString stringWithFormat:@"%0.2f",num];
    
}
@end
