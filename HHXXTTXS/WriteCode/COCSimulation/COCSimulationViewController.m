//
//  COCSimulationViewController.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCSimulationViewController.h"
#import "ContractHeader.h"
@interface COCSimulationViewController ()<ContractManagerDelegate>

/** 按钮 */
@property (strong, nonatomic) UIButton *button;



@end

@implementation COCSimulationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[ContractManager manager] addDelegate:self];

    
    
}

- (UIButton *)button {
    if(!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitle:@"确定" forState:UIControlStateNormal];
        [_button setTitleColor:COCColorText_000000 forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(p_confirmBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_button setBackgroundColor:COCColorTheme];
        _button.layer.cornerRadius = SCALE_Length(3.0f);
        _button.layer.masksToBounds = YES;
    }
    return _button;
}

- (void)p_confirmBtnAction:(UIButton *)btn {
    
    OrderModel *model = [[OrderModel alloc] init];
    model.name = @"AAA";
    model.symbol = @"yyyy";
    model.identifier = @"666";
    model.tradePrice = @"100";
    model.tradeHands = @"2";
    model.lever = @"5";
    model.tradeType = ContractTradeTypeOpenLong;
    
    [[ContractManager manager] addOrderWithModel:model];
}

- (void)contractManager:(ContractManager *)manager hisOrderListDidChange:(NSDictionary<NSString *,NSArray *> *)hisOrderList {
    
}

- (void)contractManager:(ContractManager *)manager availableCapitalDidChange:(nonnull NSString *)availableCapital marketCapital:(nonnull NSString *)marketCapital {
    
    
}

- (void)contractManager:(ContractManager *)manager positionListDidChange:(NSDictionary<NSString *,GLPositionModel *> *)positionList {
    
    
}

@end
