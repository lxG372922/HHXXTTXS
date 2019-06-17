//
//  FillView.m
//  HHXXTTXS
//
//  Created by apple on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "FillView.h"
#import "OpenString.h"
@implementation FillView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self coufUI];
    }
    return self;
}

//写入UI
-(void)coufUI{
    
    UILabel *titleL = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width*0.05, Nav_topH, SCREEN_Width*0.9, SCREEN_Width*0.1)];
    titleL.textColor = RGBColor(60, 60, 60);
    titleL.font = NameFont(15);
    titleL.text = DDD;
    [self addSubview:titleL];
    
#pragma mark 姓名
    
    nameBackV = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_Width*0.05, CGRectGetMaxY(titleL.frame), SCREEN_Width*0.9, SCREEN_Width*0.12)];
    nameBackV.backgroundColor = [UIColor whiteColor];
    LXViewShadow(nameBackV, RGBColor(200, 200, 200), CGSizeMake(3, 3), 0.5, 1.5);
    [self addSubview:nameBackV];
    
    UILabel *nameL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width*0.15, nameBackV.height)];
    nameL.textColor = RGBColor(60, 60, 60);
    nameL.textAlignment = NSTextAlignmentCenter;
    nameL.font = NameFont(13);
    nameL.text = @"姓名";
    [nameBackV addSubview:nameL];
    
    [nameBackV addSubview:self.nameT];
    
    
#pragma mark 身份证号码
    
    numBackV = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_Width*0.05, CGRectGetMaxY(nameBackV.frame)+SCREEN_Width*0.05, SCREEN_Width*0.9, SCREEN_Width*0.12)];
    numBackV.backgroundColor = [UIColor whiteColor];
    LXViewShadow(numBackV, RGBColor(200, 200, 200), CGSizeMake(3, 3), 0.5, 1.5);
    [self addSubview:numBackV];
    
    UILabel *numberL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width*0.15, numBackV.height)];
    numberL.textColor = RGBColor(60, 60, 60);
    numberL.textAlignment = NSTextAlignmentCenter;
    numberL.font = NameFont(13);
    numberL.text = @"身份证号";
    [numBackV addSubview:numberL];
    
    [numBackV addSubview:self.numberT];
    
#pragma mark - 下一步
    [self addSubview:self.nextBtn];
    
    
}

- (UITextField *)nameT{
    if (!_nameT) {
        
        _nameT = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_Width*0.15, 0, SCREEN_Width*0.75, SCREEN_Width*0.12)];
        //字体
        _nameT.font = NameFont(15);
        //字体颜色
        _nameT.textColor = RGBColor(60, 60, 60);
        //无边框设置
        _nameT.borderStyle = UITextBorderStyleNone;
        
    }
    return _nameT;
}

- (UITextField *)numberT{
    if (!_numberT) {
        
        _numberT = [[UITextField alloc]initWithFrame:CGRectMake(SCREEN_Width*0.15, 0, SCREEN_Width*0.75, SCREEN_Width*0.12)];
        //字体
        _numberT.font = NameFont(15);
        //字体颜色
        _numberT.textColor = RGBColor(60, 60, 60);
        //无边框设置
        _numberT.borderStyle = UITextBorderStyleNone;
        
    }
    return _numberT;
}

- (UIButton *)nextBtn{
    if (!_nextBtn) {
        
        _nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_Width*0.08, CGRectGetMaxY(numBackV.frame)+SCREEN_Width*0.2, SCREEN_Width*0.84, SCREEN_Width*0.1)];
        LXViewRadius(_nextBtn, 5);
        _nextBtn.backgroundColor = RandomColor;
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        
    }
    return _nextBtn;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}

@end
