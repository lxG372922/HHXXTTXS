//
//  MyFooterView.m
//  NewStock
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 class. All rights reserved.
//

#import "MyFooterView.h"

@implementation MyFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.outBtn];
        [self addSubview:self.bgView];
        [self addSubview:self.lab];
        
        [self refreashLayout];
    }
    return self;
}

- (UIButton *)outBtn{
    if(!_outBtn){
        _outBtn = [[UIButton alloc]init];
        [_outBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        _outBtn.backgroundColor = RGB(51, 51, 51);
        _outBtn.layer.masksToBounds = YES;
        _outBtn.layer.cornerRadius = 10;
    }
    return _outBtn;
}


- (UIView *)bgView {
    if(!_bgView){
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = RGB(255, 255, 255);
    }
    return _bgView;
}
- (UILabel *)lab{
    if(!_lab){
        _lab = [[UILabel alloc]init];
        _lab.textColor = RGB(151, 151, 151);
        _lab.font = FONT(13);
        _lab.text = @"投资前请仔细阅读风险披露以及服务条款。市场有风险，投资需谨慎，请根据自身实际情况制定投资计划。";
        _lab.textAlignment = NSTextAlignmentCenter;
        _lab.numberOfLines = 0;
    }
    return _lab;
}
-(void)refreashLayout{
    [_outBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(30);
        make.top.equalTo(self.mas_top).mas_offset(18);
        make.right.equalTo(self.mas_right).mas_offset(-30);
        make.height.mas_equalTo(40);
    }];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(15);
        make.top.equalTo(self.mas_top).mas_offset(60);
        make.right.equalTo(self.mas_right).mas_offset(-15);
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);
    }];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).mas_offset(0);
        make.top.equalTo(self.bgView.mas_top).mas_offset(30);
        make.right.equalTo(self.bgView.mas_right).mas_offset(0);
        make.height.mas_equalTo(40);
    }];
    
}
@end
