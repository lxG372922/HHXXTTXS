//
//  detailsTopView.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "detailsTopView.h"



@implementation detailsTopView

-(instancetype)initWithFrame:(CGFloat)top model:(MarketModelHX *)model{
    
    if (self = [super initWithFrame:CGRectMake(0, top, SCREEN_WIDTH, 70)]) {
        
        
        _priceLabel = [myLabel labelWithframe:CGRectZero backgroundColor:ColorClear title:model.current font:16 Alignment:NSTextAlignmentCenter textColor:COCColorLong];
        [self addSubview:_priceLabel];
        
        _chanPriceLabel = [myLabel labelWithframe:CGRectZero backgroundColor:ColorClear title:[self getChangeprice] font:14 Alignment:NSTextAlignmentCenter textColor:COCColorLong];
        [self addSubview:_chanPriceLabel];
        
        _changBaiPriceLabel =[myLabel labelWithframe:CGRectZero backgroundColor:ColorClear title:[self getChangeBai] font:14 Alignment:NSTextAlignmentCenter textColor:COCColorLong];
        [self addSubview:_changBaiPriceLabel];
        
      
        
        _buyNumLabel = [myLabel labelWithframe:CGRectZero backgroundColor:ColorClear title:@"8 买量" font:14 Alignment:NSTextAlignmentCenter textColor:COCColorLong];
        [self addSubview:_buyNumLabel];
        
        _sellNumLabel = [myLabel labelWithframe:CGRectZero backgroundColor:ColorClear title:@"10 卖量" font:14 Alignment:NSTextAlignmentCenter textColor:COCColorShort];
        
        [self addSubview:_sellNumLabel];
        
        _buyColorlabel = [myLabel labelWithframe:CGRectZero backgroundColor:COCColorLong title:@"" font:14 Alignment:NSTextAlignmentCenter textColor:COCColorLong];
        [self addSubview:_buyColorlabel];
        
        _sellColorLabel = [myLabel labelWithframe:CGRectZero backgroundColor:COCColorShort title:@"" font:14 Alignment:NSTextAlignmentCenter textColor:COCColorLong];
        [self addSubview:_sellColorLabel];
        [self sizeUI];
        
    }

    return self;
}

-(void)sizeUI{
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(20);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [_chanPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLabel.mas_right).offset(10);
        make.bottom.equalTo(self.mas_centerY).offset(-8);
    }];
    
    [_changBaiPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.chanPriceLabel);
        make.top.equalTo(self.mas_centerY).offset(8);
    }];
    
    [_buyNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.chanPriceLabel);
        
        
    }];
    
//    [_buyColorlabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.buyNumLabel.mas_left).offset(-10);
//        make.height.mas_equalTo(8);
//        make.centerY.mas_equalTo(self.buyNumLabel);
//
//    }];
    
    [_sellNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.buyNumLabel);
        make.top.mas_equalTo(self.changBaiPriceLabel);
    }];
    
//    [_sellColorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.buyNumLabel.mas_left).offset(-10);
//        make.height.mas_equalTo(8);
//        make.centerY.mas_equalTo(self.sellNumLabel);
//
//    }];
    
    
    //添加计时器
    _timerxjh = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changechanges) userInfo:nil repeats:YES];
    
    [self changechanges];
}
-(void)changechanges{
    
    int changNUM = arc4random_uniform(2);
    NSString * changP;
    UIColor * changeC;
    
    if (changNUM == 1) {
        
        changP = [NSString stringWithFormat:@"+%u",arc4random_uniform(60)+10];
        changeC = COCColorLong;
    }else{
        
        changP = [NSString stringWithFormat:@"-%u",arc4random_uniform(60)+6];
        changeC = COCColorShort;
    }
    _priceLabel.textColor = changeC;
    _chanPriceLabel.textColor = changeC;
    _changBaiPriceLabel.textColor = changeC;
    
    _chanPriceLabel.text = changP;
    _changBaiPriceLabel.text = [self getChangeBai];
    
    int buyn = arc4random_uniform(70)+15;
    int selln = arc4random_uniform(70)+13;
   
    _buyNumLabel.text = [NSString stringWithFormat:@"%d  买量",buyn];
    _sellNumLabel.text = [NSString stringWithFormat:@"%d  卖量",selln];
    
    CGFloat hei = self.height/2-8-13;
    _buyColorlabel.frame= CGRectMake(SCREEN_WIDTH-90-buyn,hei , buyn+21, 8);
    
    _sellColorLabel.frame= CGRectMake(SCREEN_WIDTH-90-selln, self.height/2+13, selln+21, 8);
}

-(NSString*)getChangeprice{
  
    return [NSString stringWithFormat:@"+%u",arc4random_uniform(100)];
}

-(NSString*)getChangeBai{
    
    return [NSString stringWithFormat:@"0.%u%%",arc4random_uniform(100)];
    
}
-(void)dealloc{
    
    if (_timerxjh) {
        [_timerxjh invalidate];
        _timerxjh = nil;
        
    }
    
}
@end
