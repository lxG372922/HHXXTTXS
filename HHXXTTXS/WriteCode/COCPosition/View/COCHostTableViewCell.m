//
//  COCHostTableViewCell.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCHostTableViewCell.h"
#import "COCHisRecordsModel.h"
@implementation COCHostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setPositionTableViewCellControlContentWithModel:(COCHisRecordsModel *)dataModel
{
    self.pro_Name.text = dataModel.pro_Name;
    self.pro_Time.text = dataModel.pro_Time;
    self.pro_Shou.text = dataModel.pro_shou;
    self.pro_roatePoint.text = dataModel.pro_roatePoint;
    self.pro_style.text = dataModel.pro_style;
    self.pro_JSYKSPrice.text = dataModel.pro_JSYKSPrice;
    
    if ([dataModel.pro_shou isEqualToString:@"多"]) {
        self.pro_kongOrDuo.image = [UIImage imageNamed:@"duo-3"];
    }else{
        self.pro_kongOrDuo.image = [UIImage imageNamed:@"kong-2"];
    }
    
}
@end
