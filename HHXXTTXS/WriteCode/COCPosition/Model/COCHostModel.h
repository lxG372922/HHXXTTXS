//
//  COCHostModel.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface COCHostModel : NSObject<NSCoding>

@property (nonatomic,strong) NSString *totailCapital;//浮动总亏盈
@property (nonatomic,strong) NSString *avaiCapital;//可用资金
@property (nonatomic,strong) NSString *bondCapital;//持仓保证金
@property (nonatomic,strong) NSString *netCapital;//资产净值

+ (instancetype)createModelWithData:(NSDictionary *)dataDict;

@end

NS_ASSUME_NONNULL_END
