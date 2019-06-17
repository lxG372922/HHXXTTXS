//
//  BottomView.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BottomView : UIView
@property(nonatomic,strong) UILabel * pricetitelLabel ;
@property(nonatomic,strong) UILabel * priceLabel ;

@property(nonatomic,strong) UIButton * buyBtn ;
@property(nonatomic,strong) UIButton * clickChangeBtn ;
@property(nonatomic,strong) UIButton * sellbtn ;
@property(nonatomic,strong) NSTimer * timerxjh ;
@property(nonatomic,copy) NSString * prices;

-(instancetype)initWithPrince:(NSString*)price maneyALl:(NSString*)moneyall  buyAction:(void(^)(void))BuyAction clickCenBtn:(void(^)(void))ClickCenBtn sellAction:(void(^)(void))SellAction;

@end

NS_ASSUME_NONNULL_END
