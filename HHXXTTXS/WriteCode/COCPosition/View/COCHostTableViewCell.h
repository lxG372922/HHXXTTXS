//
//  COCHostTableViewCell.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class COCHisRecordsModel;
NS_ASSUME_NONNULL_BEGIN

@interface COCHostTableViewCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel *pro_Time;//时间
@property (nonatomic,weak) IBOutlet UILabel *pro_Name;//产品名
@property (nonatomic,weak) IBOutlet UILabel *pro_Shou;//交易数量
@property (nonatomic,weak) IBOutlet UILabel *pro_style;//交易状态
@property (nonatomic,weak) IBOutlet UILabel *pro_JSYKSPrice;//结算盈亏
@property (nonatomic,weak) IBOutlet UILabel *pro_roatePoint;//结算盈亏比例
@property (nonatomic,weak) IBOutlet UIImageView *pro_kongOrDuo;//空或多

-(void)setPositionTableViewCellControlContentWithModel:(COCHisRecordsModel *)dataModel;



@end

NS_ASSUME_NONNULL_END
