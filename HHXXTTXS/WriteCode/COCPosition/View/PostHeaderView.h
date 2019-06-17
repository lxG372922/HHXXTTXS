//
//  PostHeaderView.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class COCHostModel;
NS_ASSUME_NONNULL_BEGIN

@interface PostHeaderView : UIView
-(instancetype)initWithDataModel:(COCHostModel*)model oiginY:(CGFloat)oiginY;
@end

NS_ASSUME_NONNULL_END
