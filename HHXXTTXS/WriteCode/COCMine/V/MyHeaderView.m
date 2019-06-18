//
//  MyHeaderView.m
//  NewStock
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 class. All rights reserved.
//

#import "MyHeaderView.h"
#import "SelectPhotoManager.h"

@interface  MyHeaderView()

@property (nonatomic, strong)SelectPhotoManager *photoManager;

@end
@implementation MyHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgImage];
        [self addSubview:self.headerImage];
        [self addSubview:self.nameLab];
        [self addSubview:self.signatureLab];
        [self addSubview:self.certificationBtn];
        [self addSubview:self.integralLab];
        [self addSubview:self.integralNum];
        
        [self createHeaderViewFrame];
        
    }
    return self;
}
- (UIImageView *)bgImage{
    if(!_bgImage){
        _bgImage = [[UIImageView alloc]init];
//        _bgImage.backgroundColor = RGB(222, 222, 222);
        _bgImage.image = [UIImage imageNamed:@"bg"];
    }
    return _bgImage;
}

- (UIImageView *)headerImage{
    if(!_headerImage){
        _headerImage = [[UIImageView alloc]init];
        _headerImage.layer.cornerRadius = 25;
        _headerImage.layer.masksToBounds =YES;
        _headerImage.backgroundColor = [UIColor redColor];
        UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGRActionChangeHeaderImg)];
        //为View标签添加手势
        self.headerImage.userInteractionEnabled=YES;
        [self.headerImage addGestureRecognizer:gesture];
    }
    return _headerImage;
}
- (void)tapGRActionChangeHeaderImg{
    
    if (!_photoManager) {
        _photoManager =[[SelectPhotoManager alloc]init];
    }
    [_photoManager startSelectPhotoWithImageName:@"选择头像"];
    __weak typeof(self)mySelf=self;
    
    //选取照片成功
    _photoManager.successHandle=^(SelectPhotoManager *manager,UIImage *image){
        mySelf.headerImage.image = image;
        //保存到本地
    NSData *data = UIImagePNGRepresentation(image);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"headerImage"];
    };
    
}
- (UILabel *)nameLab{
    if(!_nameLab){
        _nameLab = [[UILabel alloc]init];
        _nameLab.text = @"全天下最最最最";
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.font = FONT(16);
        
    }
    return _nameLab;
}
- (UILabel *)signatureLab{
    if(!_signatureLab){
        _signatureLab = [[UILabel alloc]init];
        _signatureLab.text = @"全天下最最最最";
        _signatureLab.textAlignment = NSTextAlignmentCenter;
        _signatureLab.font = FONT(14);
    }
    return _signatureLab;
}

- (UIButton *)certificationBtn{
    if(!_certificationBtn){
        _certificationBtn = [[UIButton alloc]init];
        _certificationBtn.backgroundColor = RGB(244, 244, 20);
        [_certificationBtn setTitle:@"实名认证" forState:UIControlStateNormal];
        [_certificationBtn setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
        _certificationBtn.layer.cornerRadius = 10;
        _certificationBtn.layer.masksToBounds = YES;
    }
    return _certificationBtn;
}
- (UILabel *)integralNum{
    if(!_integralNum){
        _integralNum = [[UILabel alloc]init];
        _integralNum.textAlignment = NSTextAlignmentCenter;
        _integralNum.text = @"100000";
    }
    return _integralNum;
}
- (UILabel *)integralLab{
    if(!_integralLab){
        _integralLab = [[UILabel alloc]init];
        _integralLab.text = @"可用积分(积分)";
        _integralLab.textAlignment = NSTextAlignmentCenter;
        _integralLab.font = FONT(15);
    }
    return _integralLab;
}


-(void)createHeaderViewFrame{
    
    [_bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(0);
        make.top.equalTo(self.mas_top).mas_offset(0);
        make.right.equalTo(self.mas_right).mas_offset(0);
        make.bottom.equalTo(self.mas_bottom).mas_offset(0);
//        make.width.mas_equalTo();
//        make.height.mas_equalTo(100);
    }];
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset((SCREEN_WIDTH - 50) / 2);
        make.top.equalTo(self.mas_top).mas_offset(20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(25);
        make.top.equalTo(self.mas_top).mas_offset(80);
        make.width.mas_equalTo(SCREEN_WIDTH - 50);
        make.height.mas_equalTo(20);
    }];
    
    [_signatureLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(25);
        make.top.equalTo(self.mas_top).mas_offset(105);
        make.width.mas_equalTo(SCREEN_WIDTH - 50);
        make.height.mas_equalTo(18);
    }];
    
    [_certificationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).mas_offset(50);
        make.top.equalTo(self.mas_top).mas_offset(150);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(35);
    }];
    
    [_integralLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).mas_offset(-40);
        make.top.equalTo(self.mas_top).mas_offset(130);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(20);
    }];
    
    [_integralNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).mas_offset(-40);
        make.top.equalTo(self.mas_top).mas_offset(160);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(20);
    }];
    
}
@end
