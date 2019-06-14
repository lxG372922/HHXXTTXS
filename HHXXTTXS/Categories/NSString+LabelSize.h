//
//  NSString+LabelSize.h
//  ForeignExchangeFutures
//
//  Created by mac on 2019/6/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (LabelSize)

- (CGSize)boundingRectWithSize:(CGSize)size fontSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
