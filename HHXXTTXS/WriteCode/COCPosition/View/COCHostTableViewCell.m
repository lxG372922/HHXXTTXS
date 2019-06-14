//
//  COCHostTableViewCell.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import "COCHostTableViewCell.h"

@implementation COCHostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if([super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIView *backView = [[UIView alloc]init];
        backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2f];
        backView.frame = CGRectMake(0, 10, SCREEN_Width, 50);
        [self addSubview:backView];
        [backView addSubview:self.titleLab];
        [backView addSubview:self.timeLab];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


-(void)setNewsTableViewCellControlContentWithModel:(COCHostModel *)dataModel{
    
    
}


- (UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = [[UILabel alloc]init];
        _titleLab.frame = CGRectMake(0, 5, SCREEN_Width, 20);
        _titleLab.text = @"腾讯QQ与华为联合在移动办联欢晚会....";
        _titleLab.textColor = RGBColor(36, 210, 212);
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}
- (UILabel *)timeLab{
    if(!_timeLab){
        _timeLab = [[UILabel alloc]init];
         _timeLab.frame = CGRectMake(10, CGRectGetMaxY(_titleLab.frame) + 5, 200, 20);
        _timeLab.text = @"2019-19-08 12:07:33";
        _timeLab.textColor = RGBColor(255, 255, 255);
        _timeLab.font = [UIFont systemFontOfSize:14];
    }
    return _timeLab;
}



@end
