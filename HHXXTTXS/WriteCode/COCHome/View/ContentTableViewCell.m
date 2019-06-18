//
//  ContentTableViewCell.m
//  GUPP
//
//  Created by apple on 2019/6/18.
//  Copyright © 2019 apple. All rights reserved.
//

#define XXXXFont(x) [UIFont fontWithName:@"PingFangSC-Light" size:x]//苹方细体

#define MMMRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#import "ContentTableViewCell.h"

@implementation ContentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self addSubview:self.contentL];
    }
    return self;
}

- (UILabel *)contentL{
    if (!_contentL) {
        _contentL = [[UILabel alloc]init];
        _contentL.numberOfLines = 0;
        _contentL.textColor = MMMRGB(60, 60, 60);
        _contentL.font = XXXXFont(15);
    }
    return _contentL;
}
//CGRectMake(S_W*0.05, 0, S_W*0.9, S_W*0.1)
@end
