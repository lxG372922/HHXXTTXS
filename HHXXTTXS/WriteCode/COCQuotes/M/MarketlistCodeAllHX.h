//
//  MarketlistCodeAllHX.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MarketlistCodeAllHX : NSObject
///代码前缀称号
@property(nonatomic,copy) NSString *     product_no;
///名称
@property(nonatomic,copy) NSString *     contract_name;
///代码code
@property(nonatomic,copy) NSString *     product_code;

@property(nonatomic,copy) NSString *     main_flag;
///无前缀号
@property(nonatomic,copy) NSString *     contract_no;
@property(nonatomic,copy) NSString *     sort;
@property(nonatomic,copy) NSString *     no;
@end

NS_ASSUME_NONNULL_END
