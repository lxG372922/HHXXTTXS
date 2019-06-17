//
//  MarketTableViewCell.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "MarketTableViewCell.h"

@implementation MarketTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
     _priceLabe.backgroundColor = COCColorLong;
    XViewBord(_backView, ColorGrayQian, 1);
    XViewRadius(_backView, 4);
}

-(void)setMarketmodel:(MarketModelHX *)marketmodel{
    
   
    _priceLabe.text = marketmodel.current;
   
    _changBaiLabe.text =[self getchangelabel];
    
    if (!_dicts) {
        _dicts = [MarketModelHX codeForName];
    }
     _nameLabel.text = _dicts[marketmodel.product_code];
    
}
-(NSString*)getchangelabel{
    
    NSString * sss ;
    if (arc4random_uniform(2)==1) {
        
        sss = @"+";
        _changBaiLabe.backgroundColor = COCColorLong;
        
    }else{
        sss = @"-";
        _changBaiLabe.backgroundColor = COCColorShort;
    }
    return [NSString stringWithFormat:@"%@%d.%d%%",sss,arc4random_uniform(3),arc4random_uniform(99)];
    
}


@end
