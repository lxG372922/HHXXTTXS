//
//  COCHostTableViewCell.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCHostTableViewCell.h"
#import "GLPositionModel.h"

@implementation COCHostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setPositionTableViewCellControlContentWithModel:(GLPositionModel *)dataModel
{
    self.pro_Name.text = dataModel.name;
    self.pro_Time.text = dataModel.avgTime;
    self.pro_Shou.text = dataModel.totalHands;
    self.pro_roatePoint.text = dataModel.margin;
    
    self.pro_JSYKSPrice.text = dataModel.name;
    
    if (dataModel.positionType == ContractPositionTypeLong) {
        self.pro_style.text = @"买多";
        self.pro_kongOrDuo.image = [UIImage imageNamed:@"duo-3"];
    }else if(dataModel.positionType == ContractPositionTypeShort){
        self.pro_style.text = @"卖空";
        self.pro_kongOrDuo.image = [UIImage imageNamed:@"kong-2"];
    }
    
}
@end
