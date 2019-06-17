//
//  COCPosTableViewCell.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCPosTableViewCell.h"

@implementation COCPosTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.setYSButton.layer.cornerRadius = 5;
    self.setYSButton.layer.borderColor = UIColor.blackColor.CGColor;
    self.setYSButton.layer.borderWidth = 1;
    
    self.marketDetailBtn.layer.cornerRadius = 5;
    self.marketDetailBtn.layer.borderColor = UIColor.blackColor.CGColor;
    self.marketDetailBtn.layer.borderWidth = 1;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//设置止盈止损
-(IBAction)setZyzsBtn:(id)sender{
    if (self.setZYZSblock) {
        self.setZYZSblock();
    }
}
-(IBAction)marketBtn:(id)sender{
    if (self.Marketblock) {
        self.Marketblock();
    }
}
-(IBAction)pingcangBtn:(id)sender{
    if (self.pingCblock) {
        self.pingCblock(@1);
    }
}

-(void)setPositionTableViewCellControlContentWithModel:(PositionModel *)dataModel{
    
    self.pro_Name.text = dataModel.pro_Name;
     self.pro_shou.text = dataModel.pro_shou;
     self.pro_duoOrKong.text = dataModel.pro_duoOrKong;
     self.pro_Price.text = dataModel.pro_Price;
     self.pro_KCPrice.text = dataModel.pro_KCPrice;
     self.pro_nowPrice.text = dataModel.pro_nowPrice;
     self.pro_zhiyPrice.text = dataModel.pro_zhiyPrice;
     self.pro_zhiyPrice.text = dataModel.pro_zhisPrice;
}

@end
