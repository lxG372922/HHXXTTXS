//
//  marketViewTools.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarketModelHX.h"
NS_ASSUME_NONNULL_BEGIN

@interface marketViewTools : NSObject
///获取详情的顶部view
-(UIView*)getDetailTopView:(CGFloat)top model:(MarketModelHX*)model;
@end

NS_ASSUME_NONNULL_END
