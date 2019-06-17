//
//  COCSetCCViewController.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface COCSetCCViewController : COCBaseViewController
@property (nonatomic,weak)IBOutlet UILabel *proNameLabel;//产品名
@property (nonatomic,weak)IBOutlet UILabel *numberLabel;//交易数量
@property (nonatomic,weak)IBOutlet UILabel *dOrKongLabel;//买多或买空
@property (nonatomic,weak)IBOutlet UILabel *zhiSLabel;//止损
@property (nonatomic,weak)IBOutlet UILabel *zhiYLabel;//止盈
@property (nonatomic,weak)IBOutlet UILabel *baoZLabel;//保证金
@property(nonatomic,weak)IBOutlet UILabel *shouxuZLabel;//保证金
@property (nonatomic,weak)IBOutlet UITextField *setZhiSTF;//设置止损
@property (nonatomic,weak)IBOutlet UITextField *setZhiYTF;//设置止盈


@end

NS_ASSUME_NONNULL_END
