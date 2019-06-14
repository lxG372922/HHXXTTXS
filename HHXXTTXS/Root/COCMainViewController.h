//
//  COCMainViewController.h
//  HHXXTTXS
//
//  Created by apple on 2019/6/14.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface COCMainViewController : UITabBarController

+ (instancetype)shareInstance;

- (UITabBarController *)tabBarVC;

@end

NS_ASSUME_NONNULL_END
