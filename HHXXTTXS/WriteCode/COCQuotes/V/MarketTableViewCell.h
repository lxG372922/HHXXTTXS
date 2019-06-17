//
//  MarketTableViewCell.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketModelHX.h"
NS_ASSUME_NONNULL_BEGIN

@interface MarketTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabe;

@property (weak, nonatomic) IBOutlet UILabel *changBaiLabe;

@property(nonatomic,strong) MarketModelHX * marketmodel ;
@property(nonatomic,strong) NSDictionary * dicts ;
@end

NS_ASSUME_NONNULL_END
