//
//  UITextField+PlaceHolder.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UITextField+PlaceHolder.h"

@implementation UITextField (PlaceHolder)


- (void)setPlaceHolder:(NSString *)placeHolder {
    UILabel *placeHolderStr = [[UILabel alloc] initWithFrame:CGRectMake(0, 190, 234, 234)];
    placeHolderStr.text = placeHolder;
//    placeHolderStr.numberOfLines = 0;
    placeHolderStr.textColor = [UIColor whiteColor];
    [placeHolderStr sizeToFit];
    [self addSubview:placeHolderStr];
    placeHolderStr.font = FONT(15);
    
    
    [self setValue:placeHolderStr forKey:@"_placeholderLabel"];
    
}

@end
