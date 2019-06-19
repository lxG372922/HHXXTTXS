//
//  COCAboutView.m
//  HHXXTTXS
//
//  Created by Mac on 2019/6/19.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCAboutView.h"
#import "NSString+LabelSize.h"
@interface COCAboutView ()

/** logo */
@property (strong, nonatomic) UIImageView *logoView;

/** name */
@property (strong, nonatomic) UILabel *nameLabel;

/** 详细信息 */
@property (strong, nonatomic) UILabel *infoLabel;

/** 字符串属性 */
@property (strong, nonatomic) NSDictionary *attribute;

@end

@implementation COCAboutView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self p_setUpUI];
    }
    return self;
}


- (CGFloat)getHeight {
    
    CGFloat infoHeight = [self.infoLabel.attributedText.string boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - SCALE_Length(40.0f), 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:self.attribute context:nil].size.height;
    
    return SCALE_Length(40 + 80 + 10 + 20 + 30 + 20) + infoHeight;
}


- (void)p_setUpUI {
    
    [self addSubview:self.logoView];
    
    [self addSubview:self.nameLabel];
    
    [self addSubview:self.infoLabel];
    
    [self p_layout];
}

- (void)p_layout {
    
    [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(SCALE_Length(40.0f));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(SCALE_Length(80.0f), SCALE_Length(80.0f)));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoView.mas_bottom).offset(SCALE_Length(10.0f));
        make.centerX.equalTo(self);
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(SCALE_Length(30.0f));
        make.left.equalTo(self.mas_left).offset(SCALE_Length(20.0f));
        make.right.equalTo(self.mas_right).offset(SCALE_Length(- 20.0f));
    }] ;
    
}


- (UIImageView *)logoView {
    if (!_logoView) {
        _logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSDictionary gl_getIconName]]];
        _logoView.layer.cornerRadius = 3.0f;
        _logoView.layer.masksToBounds = YES;
    }
    return _logoView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont fontWithName:fFont size:18.0f];
        _nameLabel.textColor = COCColorTitle;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = [NSDictionary gl_getCurrentAppName];
    }
    return _nameLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        _infoLabel.font = [UIFont fontWithName:fFont size:18.0f];
        _infoLabel.textColor = COCColorTitle;
        _infoLabel.attributedText = [[NSAttributedString alloc] initWithString:@"国际原油期货是一个创新的期货开户&模拟软件，本公司上海好程金融信息服务有限公司是一家成立于上海的金融公司，与上交所、港交所、纽交所等各大交易所建立了深厚的合作关系。全真模拟期货交易，极速开户，是您期货投资不可缺少的移动App。\n 公司自成立以来，秉承稳健经营、创新发展的宗旨，覆盖全球金融市场、多元化产品任您选择、提供最稳定的金融服务。\n 我们将扎实雄厚的技术实力以及专业创新的研究服务作为依托，为您提供配套完善的服务体系。专注服务广大期货用户，为广大期货投资者提供优质服务。" attributes:self.attribute];
        
        _infoLabel.numberOfLines = 0;
    }
    return _infoLabel;
}

- (NSDictionary *)attribute {
    if (!_attribute) {
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 3.0f;
        style.firstLineHeadIndent = 20.0f;
        _attribute = @{NSParagraphStyleAttributeName:style,NSFontAttributeName:[UIFont fontWithName:fFont size:18.0f]};
    }
    return _attribute;
}

@end
