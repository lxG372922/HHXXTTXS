//
//  COCTransViewController.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface COCTransViewController : COCBaseViewController

/*
 *
 ** KongOrDuo 买空或买多
 ** price 价格
 ** BaoZJin 保证金
 ** shouxuFei 手续费
 ** isSelectedJY  是否点击交易
 */

-(void)creatDataWith:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
