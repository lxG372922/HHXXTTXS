//
//  MarketDetailsViewController.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCBaseViewController.h"
#import "MarketModelHX.h"
NS_ASSUME_NONNULL_BEGIN

@interface MarketDetailsViewController : COCBaseViewController
@property(nonatomic,strong) MarketModelHX * marketmodel ;
///名字
@property(nonatomic,copy) NSString * marketName;

@end

NS_ASSUME_NONNULL_END
