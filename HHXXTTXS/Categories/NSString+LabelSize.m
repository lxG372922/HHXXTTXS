//
//  NSString+LabelSize.m
//  ForeignExchangeFutures
//
//  Created by mac on 2019/6/13.
//

#import "NSString+LabelSize.h"

@implementation NSString (LabelSize)


-(CGSize)boundingRectWithSize:(CGSize)size fontSize:(CGFloat)fontSize{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    
    CGSize retSize = [self boundingRectWithSize:size
                                        options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}


@end
