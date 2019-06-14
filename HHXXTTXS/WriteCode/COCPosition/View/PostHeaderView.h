//
//  PostHeaderView.h
//  HHXXTTXS
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PositionModel;
NS_ASSUME_NONNULL_BEGIN

@interface PostHeaderView : UIView
-(instancetype)initWithDataModel:(PositionModel*)model oiginY:(CGFloat)oiginY;
@end

NS_ASSUME_NONNULL_END
