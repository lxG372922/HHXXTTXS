//
//  CarryView.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "CarryView.h"
#import "OpenString.h"
@implementation CarryView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setMoreUI];
        
    }
    return self;
}

-(void)setMoreUI{
    
    iconImageV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_Width*0.35, SCREEN_Height*0.2, SCREEN_Width*0.3, SCREEN_Width*0.3*0.865)];
//    LXViewRadius(iconImageV, SCREEN_Width*0.15);
    iconImageV.image = LXGetImage(@"waiting");
    [self addSubview:iconImageV];
    
    titleL = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(iconImageV.frame)+20, SCREEN_Width, SCREEN_Width*0.1)];
    titleL.textColor = RGBColor(30, 30, 30);
    titleL.font = NameBFont(15);
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.text = EEE;
    [self addSubview:titleL];
    
    contenL = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width*0.1, CGRectGetMaxY(titleL.frame)+20, SCREEN_Width*0.8, SCREEN_Width*0.2)];
    contenL.textColor = RGBColor(30, 30, 30);
    contenL.numberOfLines = 0;
    contenL.font = NameFont(12);
    contenL.textAlignment = NSTextAlignmentCenter;
    contenL.text = FFF;
    [self addSubview:contenL];
    
    [self addSubview:self.srueBtn];
}

#pragma mark - 下一步按钮
- (UIButton *)srueBtn{
    if (!_srueBtn) {
        
        _srueBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width*0.08, CGRectGetMaxY(contenL.frame), SCREEN_Width*0.84, SCREEN_Width*0.1)];
        LXViewRadius(_srueBtn, 5);
        _srueBtn.backgroundColor = RGBColor(50, 50, 50);
        [_srueBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_srueBtn addTarget:self action:@selector(backController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _srueBtn;
}

-(void)backController{
    
    [[super viewController].navigationController popViewControllerAnimated:YES];
    
}

@end
