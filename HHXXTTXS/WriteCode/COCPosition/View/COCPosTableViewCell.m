//
//  COCPosTableViewCell.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/16.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCPosTableViewCell.h"
#import "GLPositionModel.h"
@implementation COCPosTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.setYSButton.layer.cornerRadius = 5;
    self.setYSButton.layer.borderColor = UIColor.blackColor.CGColor;
    self.setYSButton.layer.borderWidth = 1;
    
    self.marketDetailBtn.layer.cornerRadius = 5;
    self.marketDetailBtn.layer.borderColor = UIColor.blackColor.CGColor;
    self.marketDetailBtn.layer.borderWidth = 1;
    [self.pingCButton setBackgroundColor:BTNCOlor];
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

-(void)setPositionTableViewCellControlContentWithModel:(GLPositionModel *)dataModel{
    
     self.pro_Name.text = dataModel.name;
     self.pro_shou.text = dataModel.totalHands;
    if (dataModel.positionType == ContractPositionTypeLong) {
        self.pro_duoOrKong.text = @"买多";
        self.pro_duoOrKong.backgroundColor = COCColorLong;
    }else{
        self.pro_duoOrKong.text = @"买空";
        self.pro_duoOrKong.backgroundColor = COCColorShort;
    }
    CGFloat plValue = ([dataModel.currentPrice floatValue] - [dataModel.avgPrice floatValue]);
     self.pro_Price.text = [NSString stringWithFormat:@"%.2f",plValue];
     self.pro_KCPrice.text = dataModel.avgPrice;
     self.pro_nowPrice.text = dataModel.currentPrice;
     self.pro_zhiyPrice.text = dataModel.zhiYPrice;
     self.pro_zhisPrice.text = dataModel.zhiSPrice;
}

@end
