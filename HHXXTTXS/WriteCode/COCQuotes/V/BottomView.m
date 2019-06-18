//
//  BottomView.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView

-(instancetype)initWithPrince:(NSString *)price maneyALl:(NSString*)moneyall  buyAction:(void (^)(void))BuyAction clickCenBtn:(void (^)(void))ClickCenBtn sellAction:(void (^)(void))SellAction{
    
    if (self = [super initWithFrame:CGRectMake(0, SCREEN_HEIGHT-160, SCREEN_WIDTH, 160)]) {
        
       //可用资金
        _pricetitelLabel = [myLabel labelWithframe:CGRectMake(10, 30, 85, 20) backgroundColor:ColorClear title:@"可用资金($):" font:14 Alignment:NSTextAlignmentRight textColor:ColorWhite];
        [self addSubview:_pricetitelLabel];
  
        _priceLabel = [myLabel labelWithframe:CGRectMake(98, 27, 100, 23) backgroundColor:ColorClear title:moneyall font:17 Alignment:NSTextAlignmentLeft textColor:COCColorLong];
        [self addSubview:_priceLabel];
        
        CGFloat hei = 70;
        CGFloat wid = (SCREEN_WIDTH-90-20)/2;
        CGFloat ttop = self.height-10-90;
        _buyBtn = [myButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(0,ttop , wid, hei) title:price colors:ColorWhite andBackground:COCColorLong tag:167 andBlock:^(myButton *button) {
           
            BuyAction();
            
        }];
        
        [self addSubview:_buyBtn];
        
        
        _clickChangeBtn = [myButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(wid+20, ttop, hei, hei) title:@"交易" colors:COCColorLong andBackground:ColorWhite tag:19889 andBlock:^(myButton *button) {
           
            ClickCenBtn();
            
        }];
        [self addSubview:_clickChangeBtn];
        
        _sellbtn = [myButton buttonWithType:UIButtonTypeCustom frame:CGRectMake(SCREEN_WIDTH-wid, ttop, wid, hei) title:price colors:ColorWhite andBackground:[UIColor grayColor] tag:1987 andBlock:^(myButton *button) {
           
            SellAction();
            
        }];
        
        [self addSubview:_sellbtn];
        
        _prices = price;
        //添加计时器
        _timerxjh = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changechanges) userInfo:nil repeats:YES];
        
        [self changechanges];
    }
    
    
   return  self;
}



-(void)changechanges{

    CGFloat price = [_prices floatValue];
    CGFloat change = arc4random_uniform(30)+arc4random_uniform(10)*0.1;
    [_buyBtn setTitle:[NSString stringWithFormat:@"%0.2f",price + change] forState:UIControlStateNormal];
    
    [_sellbtn setTitle:[NSString stringWithFormat:@"%0.2f",price - change] forState:UIControlStateNormal];
    
}

-(void)dealloc{
    
    if (_timerxjh) {
        [_timerxjh invalidate];
        _timerxjh = nil;
        
    }
    
}
@end
