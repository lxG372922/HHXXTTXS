//
//  MyTableViewCell.m
//  NewStock
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 class. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if([super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self addSubview:self.imgV];
        [self addSubview:self.titleLab];
        [self addSubview:self.line];
        [self addSubview:self.detailsLab];
    }
    return self;
}


- (UIImageView *)imgV{
    if(!_imgV){
        _imgV = [[UIImageView alloc]init];
//        _imgV.backgroundColor = [UIColor redColor];
    }
    return _imgV;
}
- (UILabel *)titleLab{
    if(!_titleLab){
        _titleLab = [[UILabel alloc]init];
        
        _titleLab.textColor = RGB(100, 100, 100);
        _titleLab.font = FONT(16);
        
    }
    return _titleLab;
}
- (UILabel *)detailsLab{
    if(!_detailsLab){
        _detailsLab = [[UILabel alloc]init];
        
        _detailsLab.textColor = RGB(100, 100, 100);
        _detailsLab.textAlignment = NSTextAlignmentRight;
        _detailsLab.font = FONT(14);
    }
    return _detailsLab;
}

- (UILabel *)line{
    if(!_line){
        _line = [[UILabel alloc]init];
        
        _line.backgroundColor = RGB(233, 233, 233);
    }
    return _line;
}
-(void)refreashLayoutWithFrame:(int)type{
    if(type == 1){
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(20);
            make.top.equalTo(self.mas_top).mas_offset(15);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(50);
            make.top.equalTo(self.mas_top).mas_offset(15);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(20);
        }];
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(0);
            make.top.equalTo(self.mas_top).mas_offset(49);
            make.right.equalTo(self.mas_right).mas_offset(0);
            make.height.mas_equalTo(1);
        }];
    }else{
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(20);
            make.top.equalTo(self.mas_top).mas_offset(15);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(50);
            make.top.equalTo(self.mas_top).mas_offset(15);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(20);
        }];
        
        [_detailsLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).mas_offset(-40);
            make.top.equalTo(self.mas_top).mas_offset(15);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(20);
        }];
        
        
        
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).mas_offset(0);
            make.top.equalTo(self.mas_top).mas_offset(49);
            make.right.equalTo(self.mas_right).mas_offset(0);
            make.height.mas_equalTo(1);
        }];
    }
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
