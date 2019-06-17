//
//  COCHisRecordsModel.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface COCHisRecordsModel : NSObject
@property (nonatomic,strong) NSString *pro_Name;//产品名
@property (nonatomic,strong) NSString *pro_shou;//多少手
@property (nonatomic,strong) NSString *pro_duoOrKong;//买多或卖空
@property (nonatomic,strong) NSString *pro_Time;////+ 盈利亏损
@property (nonatomic,strong) NSString *pro_style;//交易状态
@property (nonatomic,strong) NSString *pro_JSYKSPrice;//结算盈亏
@property (nonatomic,strong) NSString  *pro_roatePoint;//结算盈亏比例


+ (instancetype)createModelWithData:(NSDictionary *)dataDict;

@end

NS_ASSUME_NONNULL_END
