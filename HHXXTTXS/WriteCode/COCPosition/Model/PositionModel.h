//
//  PositionModel.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PositionModel : NSObject<NSCoding>
@property (nonatomic,strong) NSString *pro_Name;//产品名
@property (nonatomic,strong) NSString *pro_shou;//多少手
@property (nonatomic,strong) NSString *pro_duoOrKong;//买多或卖空
@property (nonatomic,strong) NSString *pro_Price;////+ 盈利亏损
@property (nonatomic,strong) NSString *pro_KCPrice;//开仓价
@property (nonatomic,strong) NSString *pro_nowPrice;//现价
@property (nonatomic,strong) NSString *pro_zhiyPrice;//止盈价
@property (nonatomic,strong) NSString *pro_zhisPrice;//止损价


+ (instancetype)createModelWithData:(NSDictionary *)dataDict;

@end

NS_ASSUME_NONNULL_END
