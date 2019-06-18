//
//  YUCustomHeaderView.m
//  YUFoldingTableViewDemo
//
//  Created by caiyi on 2018/2/6.
//  Copyright © 2018年 timelywind. All rights reserved.
//

#import "YUCustomHeaderView.h"


@interface YUCustomHeaderView ()

@property (nonatomic, weak) UILabel *titleLabel;

@property (nonatomic, weak) UILabel *descriptionLabel;

@end

@implementation YUCustomHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        // 设置子视图
        [self setupSubViews];
        
    }
    return self;
}

- (void)setupSubViews
{
    // titleLabel
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    _titleLabel = titleLabel;
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = [UIColor blackColor];
    
    // descriptionLabel
    UILabel *descriptionLabel = [[UILabel alloc] init];
    [self.contentView addSubview:descriptionLabel];
    _descriptionLabel = descriptionLabel;
    descriptionLabel.font = [UIFont systemFontOfSize:15];
    descriptionLabel.textColor = [UIColor grayColor];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    
    _titleLabel.text = title;
}

- (void)setDescriptionText:(NSString *)descriptionText
{
    _descriptionText = descriptionText;
    
    _descriptionLabel.text = descriptionText;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    CGSize cellSize = self.bounds.size;
//    [_titleLabel sizeToFit];
//    _titleLabel.frame = CGRectMake(12, (cellSize.height - _titleLabel.bounds.size.height)/2.0, _titleLabel.bounds.size.width, _titleLabel.bounds.size.height);
//
//    [_descriptionLabel sizeToFit];
//    _descriptionLabel.frame = CGRectMake(cellSize.width - _descriptionLabel.bounds.size.width - 15, (cellSize.height - _descriptionLabel.bounds.size.height)/2.0, _descriptionLabel.bounds.size.width, _descriptionLabel.bounds.size.height);
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10);
        make.left.mas_offset(16);
        make.right.mas_offset(16);
        make.height.mas_offset(20);
    }];
    
    [self addSubview:_descriptionLabel];
    [_descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).mas_offset(5);
        make.left.mas_offset(16);
        make.right.mas_offset(16);
        make.height.mas_offset(15);
    }];
}


@end
