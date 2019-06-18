//
//  COCHostTableViewCell.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCHostTableViewCell.h"
#import "OrderModel.h"

@implementation COCHostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setPositionTableViewCellControlContentWithModel:(OrderModel *)dataModel
{
    self.pro_Name.text = dataModel.name;
    self.pro_Time.text = dataModel.name;
    self.pro_Shou.text = dataModel.name;
    self.pro_roatePoint.text = dataModel.name;
    self.pro_style.text = dataModel.name;
    self.pro_JSYKSPrice.text = dataModel.name;
    
    if ([dataModel.name isEqualToString:@"多"]) {
        self.pro_kongOrDuo.image = [UIImage imageNamed:@"duo-3"];
    }else{
        self.pro_kongOrDuo.image = [UIImage imageNamed:@"kong-2"];
    }
    
}
@end
