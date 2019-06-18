//
//  UITextView+PlaceHolder.m
//  HHXXTTXS
//
//  Created by mac on 2019/6/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UITextView+PlaceHolder.h"

@implementation UITextView (PlaceHolder)


- (void)setPlaceHolder:(NSString *)placeHolder {
    UILabel *placeHolderStr = [[UILabel alloc] initWithFrame:CGRectMake(0, 190, 234, 234)];
    placeHolderStr.text = placeHolder;
    //    placeHolderStr.numberOfLines = 0;
    placeHolderStr.textColor = [UIColor grayColor];
    [placeHolderStr sizeToFit];
    [self addSubview:placeHolderStr];
    placeHolderStr.font = FONT(18);
    
    
    [self setValue:placeHolderStr forKey:@"_placeholderLabel"];
    
}

@end
